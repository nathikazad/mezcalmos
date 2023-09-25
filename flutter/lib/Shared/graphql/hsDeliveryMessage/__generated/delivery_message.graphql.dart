import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$GetPastDeliveryMessages {
  factory Variables$Query$GetPastDeliveryMessages({
    required int driver_id,
    required int limit,
    required int offset,
  }) =>
      Variables$Query$GetPastDeliveryMessages._({
        r'driver_id': driver_id,
        r'limit': limit,
        r'offset': offset,
      });

  Variables$Query$GetPastDeliveryMessages._(this._$data);

  factory Variables$Query$GetPastDeliveryMessages.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$driver_id = data['driver_id'];
    result$data['driver_id'] = (l$driver_id as int);
    final l$limit = data['limit'];
    result$data['limit'] = (l$limit as int);
    final l$offset = data['offset'];
    result$data['offset'] = (l$offset as int);
    return Variables$Query$GetPastDeliveryMessages._(result$data);
  }

  Map<String, dynamic> _$data;

  int get driver_id => (_$data['driver_id'] as int);
  int get limit => (_$data['limit'] as int);
  int get offset => (_$data['offset'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$driver_id = driver_id;
    result$data['driver_id'] = l$driver_id;
    final l$limit = limit;
    result$data['limit'] = l$limit;
    final l$offset = offset;
    result$data['offset'] = l$offset;
    return result$data;
  }

  CopyWith$Variables$Query$GetPastDeliveryMessages<
          Variables$Query$GetPastDeliveryMessages>
      get copyWith => CopyWith$Variables$Query$GetPastDeliveryMessages(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetPastDeliveryMessages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driver_id = driver_id;
    final lOther$driver_id = other.driver_id;
    if (l$driver_id != lOther$driver_id) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$driver_id = driver_id;
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      l$driver_id,
      l$limit,
      l$offset,
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetPastDeliveryMessages<TRes> {
  factory CopyWith$Variables$Query$GetPastDeliveryMessages(
    Variables$Query$GetPastDeliveryMessages instance,
    TRes Function(Variables$Query$GetPastDeliveryMessages) then,
  ) = _CopyWithImpl$Variables$Query$GetPastDeliveryMessages;

  factory CopyWith$Variables$Query$GetPastDeliveryMessages.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetPastDeliveryMessages;

  TRes call({
    int? driver_id,
    int? limit,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$GetPastDeliveryMessages<TRes>
    implements CopyWith$Variables$Query$GetPastDeliveryMessages<TRes> {
  _CopyWithImpl$Variables$Query$GetPastDeliveryMessages(
    this._instance,
    this._then,
  );

  final Variables$Query$GetPastDeliveryMessages _instance;

  final TRes Function(Variables$Query$GetPastDeliveryMessages) _then;

  static const _undefined = {};

  TRes call({
    Object? driver_id = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$GetPastDeliveryMessages._({
        ..._instance._$data,
        if (driver_id != _undefined && driver_id != null)
          'driver_id': (driver_id as int),
        if (limit != _undefined && limit != null) 'limit': (limit as int),
        if (offset != _undefined && offset != null) 'offset': (offset as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetPastDeliveryMessages<TRes>
    implements CopyWith$Variables$Query$GetPastDeliveryMessages<TRes> {
  _CopyWithStubImpl$Variables$Query$GetPastDeliveryMessages(this._res);

  TRes _res;

  call({
    int? driver_id,
    int? limit,
    int? offset,
  }) =>
      _res;
}

class Query$GetPastDeliveryMessages {
  Query$GetPastDeliveryMessages({
    required this.delivery_messages,
    required this.$__typename,
  });

  factory Query$GetPastDeliveryMessages.fromJson(Map<String, dynamic> json) {
    final l$delivery_messages = json['delivery_messages'];
    final l$$__typename = json['__typename'];
    return Query$GetPastDeliveryMessages(
      delivery_messages: (l$delivery_messages as List<dynamic>)
          .map((e) => Query$GetPastDeliveryMessages$delivery_messages.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$GetPastDeliveryMessages$delivery_messages> delivery_messages;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_messages = delivery_messages;
    _resultData['delivery_messages'] =
        l$delivery_messages.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_messages = delivery_messages;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_messages.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetPastDeliveryMessages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_messages = delivery_messages;
    final lOther$delivery_messages = other.delivery_messages;
    if (l$delivery_messages.length != lOther$delivery_messages.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_messages.length; i++) {
      final l$delivery_messages$entry = l$delivery_messages[i];
      final lOther$delivery_messages$entry = lOther$delivery_messages[i];
      if (l$delivery_messages$entry != lOther$delivery_messages$entry) {
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

extension UtilityExtension$Query$GetPastDeliveryMessages
    on Query$GetPastDeliveryMessages {
  CopyWith$Query$GetPastDeliveryMessages<Query$GetPastDeliveryMessages>
      get copyWith => CopyWith$Query$GetPastDeliveryMessages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetPastDeliveryMessages<TRes> {
  factory CopyWith$Query$GetPastDeliveryMessages(
    Query$GetPastDeliveryMessages instance,
    TRes Function(Query$GetPastDeliveryMessages) then,
  ) = _CopyWithImpl$Query$GetPastDeliveryMessages;

  factory CopyWith$Query$GetPastDeliveryMessages.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPastDeliveryMessages;

  TRes call({
    List<Query$GetPastDeliveryMessages$delivery_messages>? delivery_messages,
    String? $__typename,
  });
  TRes delivery_messages(
      Iterable<Query$GetPastDeliveryMessages$delivery_messages> Function(
              Iterable<
                  CopyWith$Query$GetPastDeliveryMessages$delivery_messages<
                      Query$GetPastDeliveryMessages$delivery_messages>>)
          _fn);
}

class _CopyWithImpl$Query$GetPastDeliveryMessages<TRes>
    implements CopyWith$Query$GetPastDeliveryMessages<TRes> {
  _CopyWithImpl$Query$GetPastDeliveryMessages(
    this._instance,
    this._then,
  );

  final Query$GetPastDeliveryMessages _instance;

  final TRes Function(Query$GetPastDeliveryMessages) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_messages = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetPastDeliveryMessages(
        delivery_messages:
            delivery_messages == _undefined || delivery_messages == null
                ? _instance.delivery_messages
                : (delivery_messages
                    as List<Query$GetPastDeliveryMessages$delivery_messages>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_messages(
          Iterable<Query$GetPastDeliveryMessages$delivery_messages> Function(
                  Iterable<
                      CopyWith$Query$GetPastDeliveryMessages$delivery_messages<
                          Query$GetPastDeliveryMessages$delivery_messages>>)
              _fn) =>
      call(
          delivery_messages: _fn(_instance.delivery_messages.map(
              (e) => CopyWith$Query$GetPastDeliveryMessages$delivery_messages(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetPastDeliveryMessages<TRes>
    implements CopyWith$Query$GetPastDeliveryMessages<TRes> {
  _CopyWithStubImpl$Query$GetPastDeliveryMessages(this._res);

  TRes _res;

  call({
    List<Query$GetPastDeliveryMessages$delivery_messages>? delivery_messages,
    String? $__typename,
  }) =>
      _res;
  delivery_messages(_fn) => _res;
}

const documentNodeQueryGetPastDeliveryMessages = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetPastDeliveryMessages'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driver_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_messages'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'distinct_on'),
            value: ListValueNode(values: [
              EnumValueNode(name: NameNode(value: 'phone_number')),
              EnumValueNode(name: NameNode(value: 'received_time')),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'received_time'),
                value: EnumValueNode(name: NameNode(value: 'desc')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'phone_number'),
                value: EnumValueNode(name: NameNode(value: 'desc')),
              ),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'driver_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'driver_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'finished_time'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_is_null'),
                    value: BooleanValueNode(value: false),
                  )
                ]),
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
            name: NameNode(value: 'entry'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone_number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'driver_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'received_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'finished_time'),
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
            name: NameNode(value: 'responded_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer'),
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
      
    ]),
  ),
]);
Query$GetPastDeliveryMessages _parserFn$Query$GetPastDeliveryMessages(
        Map<String, dynamic> data) =>
    Query$GetPastDeliveryMessages.fromJson(data);

class Options$Query$GetPastDeliveryMessages
    extends graphql.QueryOptions<Query$GetPastDeliveryMessages> {
  Options$Query$GetPastDeliveryMessages({
    String? operationName,
    required Variables$Query$GetPastDeliveryMessages variables,
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
          document: documentNodeQueryGetPastDeliveryMessages,
          parserFn: _parserFn$Query$GetPastDeliveryMessages,
        );
}

class WatchOptions$Query$GetPastDeliveryMessages
    extends graphql.WatchQueryOptions<Query$GetPastDeliveryMessages> {
  WatchOptions$Query$GetPastDeliveryMessages({
    String? operationName,
    required Variables$Query$GetPastDeliveryMessages variables,
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
          document: documentNodeQueryGetPastDeliveryMessages,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetPastDeliveryMessages,
        );
}

class FetchMoreOptions$Query$GetPastDeliveryMessages
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetPastDeliveryMessages({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetPastDeliveryMessages variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetPastDeliveryMessages,
        );
}

extension ClientExtension$Query$GetPastDeliveryMessages
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetPastDeliveryMessages>>
      query$GetPastDeliveryMessages(
              Options$Query$GetPastDeliveryMessages options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetPastDeliveryMessages>
      watchQuery$GetPastDeliveryMessages(
              WatchOptions$Query$GetPastDeliveryMessages options) =>
          this.watchQuery(options);
  void writeQuery$GetPastDeliveryMessages({
    required Query$GetPastDeliveryMessages data,
    required Variables$Query$GetPastDeliveryMessages variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetPastDeliveryMessages),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetPastDeliveryMessages? readQuery$GetPastDeliveryMessages({
    required Variables$Query$GetPastDeliveryMessages variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryGetPastDeliveryMessages),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetPastDeliveryMessages.fromJson(result);
  }
}

class Query$GetPastDeliveryMessages$delivery_messages {
  Query$GetPastDeliveryMessages$delivery_messages({
    required this.id,
    required this.entry,
    required this.phone_number,
    this.driver_id,
    required this.received_time,
    this.finished_time,
    this.user_id,
    this.responded_time,
    this.customer,
    required this.$__typename,
  });

  factory Query$GetPastDeliveryMessages$delivery_messages.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$entry = json['entry'];
    final l$phone_number = json['phone_number'];
    final l$driver_id = json['driver_id'];
    final l$received_time = json['received_time'];
    final l$finished_time = json['finished_time'];
    final l$user_id = json['user_id'];
    final l$responded_time = json['responded_time'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$GetPastDeliveryMessages$delivery_messages(
      id: (l$id as int),
      entry: mapFromJson(l$entry),
      phone_number: (l$phone_number as String),
      driver_id: (l$driver_id as int?),
      received_time: (l$received_time as String),
      finished_time: (l$finished_time as String?),
      user_id: (l$user_id as int?),
      responded_time: (l$responded_time as String?),
      customer: l$customer == null
          ? null
          : Query$GetPastDeliveryMessages$delivery_messages$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic entry;

  final String phone_number;

  final int? driver_id;

  final String received_time;

  final String? finished_time;

  final int? user_id;

  final String? responded_time;

  final Query$GetPastDeliveryMessages$delivery_messages$customer? customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$entry = entry;
    _resultData['entry'] = mapToJson(l$entry);
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$driver_id = driver_id;
    _resultData['driver_id'] = l$driver_id;
    final l$received_time = received_time;
    _resultData['received_time'] = l$received_time;
    final l$finished_time = finished_time;
    _resultData['finished_time'] = l$finished_time;
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$responded_time = responded_time;
    _resultData['responded_time'] = l$responded_time;
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$entry = entry;
    final l$phone_number = phone_number;
    final l$driver_id = driver_id;
    final l$received_time = received_time;
    final l$finished_time = finished_time;
    final l$user_id = user_id;
    final l$responded_time = responded_time;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$entry,
      l$phone_number,
      l$driver_id,
      l$received_time,
      l$finished_time,
      l$user_id,
      l$responded_time,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetPastDeliveryMessages$delivery_messages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$entry = entry;
    final lOther$entry = other.entry;
    if (l$entry != lOther$entry) {
      return false;
    }
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
      return false;
    }
    final l$driver_id = driver_id;
    final lOther$driver_id = other.driver_id;
    if (l$driver_id != lOther$driver_id) {
      return false;
    }
    final l$received_time = received_time;
    final lOther$received_time = other.received_time;
    if (l$received_time != lOther$received_time) {
      return false;
    }
    final l$finished_time = finished_time;
    final lOther$finished_time = other.finished_time;
    if (l$finished_time != lOther$finished_time) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$responded_time = responded_time;
    final lOther$responded_time = other.responded_time;
    if (l$responded_time != lOther$responded_time) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
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

extension UtilityExtension$Query$GetPastDeliveryMessages$delivery_messages
    on Query$GetPastDeliveryMessages$delivery_messages {
  CopyWith$Query$GetPastDeliveryMessages$delivery_messages<
          Query$GetPastDeliveryMessages$delivery_messages>
      get copyWith => CopyWith$Query$GetPastDeliveryMessages$delivery_messages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetPastDeliveryMessages$delivery_messages<TRes> {
  factory CopyWith$Query$GetPastDeliveryMessages$delivery_messages(
    Query$GetPastDeliveryMessages$delivery_messages instance,
    TRes Function(Query$GetPastDeliveryMessages$delivery_messages) then,
  ) = _CopyWithImpl$Query$GetPastDeliveryMessages$delivery_messages;

  factory CopyWith$Query$GetPastDeliveryMessages$delivery_messages.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetPastDeliveryMessages$delivery_messages;

  TRes call({
    int? id,
    dynamic? entry,
    String? phone_number,
    int? driver_id,
    String? received_time,
    String? finished_time,
    int? user_id,
    String? responded_time,
    Query$GetPastDeliveryMessages$delivery_messages$customer? customer,
    String? $__typename,
  });
  CopyWith$Query$GetPastDeliveryMessages$delivery_messages$customer<TRes>
      get customer;
}

class _CopyWithImpl$Query$GetPastDeliveryMessages$delivery_messages<TRes>
    implements CopyWith$Query$GetPastDeliveryMessages$delivery_messages<TRes> {
  _CopyWithImpl$Query$GetPastDeliveryMessages$delivery_messages(
    this._instance,
    this._then,
  );

  final Query$GetPastDeliveryMessages$delivery_messages _instance;

  final TRes Function(Query$GetPastDeliveryMessages$delivery_messages) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? entry = _undefined,
    Object? phone_number = _undefined,
    Object? driver_id = _undefined,
    Object? received_time = _undefined,
    Object? finished_time = _undefined,
    Object? user_id = _undefined,
    Object? responded_time = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetPastDeliveryMessages$delivery_messages(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        entry: entry == _undefined || entry == null
            ? _instance.entry
            : (entry as dynamic),
        phone_number: phone_number == _undefined || phone_number == null
            ? _instance.phone_number
            : (phone_number as String),
        driver_id:
            driver_id == _undefined ? _instance.driver_id : (driver_id as int?),
        received_time: received_time == _undefined || received_time == null
            ? _instance.received_time
            : (received_time as String),
        finished_time: finished_time == _undefined
            ? _instance.finished_time
            : (finished_time as String?),
        user_id: user_id == _undefined ? _instance.user_id : (user_id as int?),
        responded_time: responded_time == _undefined
            ? _instance.responded_time
            : (responded_time as String?),
        customer: customer == _undefined
            ? _instance.customer
            : (customer
                as Query$GetPastDeliveryMessages$delivery_messages$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetPastDeliveryMessages$delivery_messages$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Query$GetPastDeliveryMessages$delivery_messages$customer
            .stub(_then(_instance))
        : CopyWith$Query$GetPastDeliveryMessages$delivery_messages$customer(
            local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$GetPastDeliveryMessages$delivery_messages<TRes>
    implements CopyWith$Query$GetPastDeliveryMessages$delivery_messages<TRes> {
  _CopyWithStubImpl$Query$GetPastDeliveryMessages$delivery_messages(this._res);

  TRes _res;

  call({
    int? id,
    dynamic? entry,
    String? phone_number,
    int? driver_id,
    String? received_time,
    String? finished_time,
    int? user_id,
    String? responded_time,
    Query$GetPastDeliveryMessages$delivery_messages$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetPastDeliveryMessages$delivery_messages$customer<TRes>
      get customer =>
          CopyWith$Query$GetPastDeliveryMessages$delivery_messages$customer
              .stub(_res);
}

class Query$GetPastDeliveryMessages$delivery_messages$customer {
  Query$GetPastDeliveryMessages$delivery_messages$customer({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$GetPastDeliveryMessages$delivery_messages$customer.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$GetPastDeliveryMessages$delivery_messages$customer(
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String? image;

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
    if (!(other is Query$GetPastDeliveryMessages$delivery_messages$customer) ||
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

extension UtilityExtension$Query$GetPastDeliveryMessages$delivery_messages$customer
    on Query$GetPastDeliveryMessages$delivery_messages$customer {
  CopyWith$Query$GetPastDeliveryMessages$delivery_messages$customer<
          Query$GetPastDeliveryMessages$delivery_messages$customer>
      get copyWith =>
          CopyWith$Query$GetPastDeliveryMessages$delivery_messages$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetPastDeliveryMessages$delivery_messages$customer<
    TRes> {
  factory CopyWith$Query$GetPastDeliveryMessages$delivery_messages$customer(
    Query$GetPastDeliveryMessages$delivery_messages$customer instance,
    TRes Function(Query$GetPastDeliveryMessages$delivery_messages$customer)
        then,
  ) = _CopyWithImpl$Query$GetPastDeliveryMessages$delivery_messages$customer;

  factory CopyWith$Query$GetPastDeliveryMessages$delivery_messages$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetPastDeliveryMessages$delivery_messages$customer;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetPastDeliveryMessages$delivery_messages$customer<
        TRes>
    implements
        CopyWith$Query$GetPastDeliveryMessages$delivery_messages$customer<
            TRes> {
  _CopyWithImpl$Query$GetPastDeliveryMessages$delivery_messages$customer(
    this._instance,
    this._then,
  );

  final Query$GetPastDeliveryMessages$delivery_messages$customer _instance;

  final TRes Function(Query$GetPastDeliveryMessages$delivery_messages$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetPastDeliveryMessages$delivery_messages$customer(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetPastDeliveryMessages$delivery_messages$customer<
        TRes>
    implements
        CopyWith$Query$GetPastDeliveryMessages$delivery_messages$customer<
            TRes> {
  _CopyWithStubImpl$Query$GetPastDeliveryMessages$delivery_messages$customer(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetCurrentDeliveryMessages {
  factory Variables$Query$GetCurrentDeliveryMessages(
          {required int driver_id}) =>
      Variables$Query$GetCurrentDeliveryMessages._({
        r'driver_id': driver_id,
      });

  Variables$Query$GetCurrentDeliveryMessages._(this._$data);

  factory Variables$Query$GetCurrentDeliveryMessages.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$driver_id = data['driver_id'];
    result$data['driver_id'] = (l$driver_id as int);
    return Variables$Query$GetCurrentDeliveryMessages._(result$data);
  }

  Map<String, dynamic> _$data;

  int get driver_id => (_$data['driver_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$driver_id = driver_id;
    result$data['driver_id'] = l$driver_id;
    return result$data;
  }

  CopyWith$Variables$Query$GetCurrentDeliveryMessages<
          Variables$Query$GetCurrentDeliveryMessages>
      get copyWith => CopyWith$Variables$Query$GetCurrentDeliveryMessages(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetCurrentDeliveryMessages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driver_id = driver_id;
    final lOther$driver_id = other.driver_id;
    if (l$driver_id != lOther$driver_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$driver_id = driver_id;
    return Object.hashAll([l$driver_id]);
  }
}

abstract class CopyWith$Variables$Query$GetCurrentDeliveryMessages<TRes> {
  factory CopyWith$Variables$Query$GetCurrentDeliveryMessages(
    Variables$Query$GetCurrentDeliveryMessages instance,
    TRes Function(Variables$Query$GetCurrentDeliveryMessages) then,
  ) = _CopyWithImpl$Variables$Query$GetCurrentDeliveryMessages;

  factory CopyWith$Variables$Query$GetCurrentDeliveryMessages.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetCurrentDeliveryMessages;

  TRes call({int? driver_id});
}

class _CopyWithImpl$Variables$Query$GetCurrentDeliveryMessages<TRes>
    implements CopyWith$Variables$Query$GetCurrentDeliveryMessages<TRes> {
  _CopyWithImpl$Variables$Query$GetCurrentDeliveryMessages(
    this._instance,
    this._then,
  );

  final Variables$Query$GetCurrentDeliveryMessages _instance;

  final TRes Function(Variables$Query$GetCurrentDeliveryMessages) _then;

  static const _undefined = {};

  TRes call({Object? driver_id = _undefined}) =>
      _then(Variables$Query$GetCurrentDeliveryMessages._({
        ..._instance._$data,
        if (driver_id != _undefined && driver_id != null)
          'driver_id': (driver_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetCurrentDeliveryMessages<TRes>
    implements CopyWith$Variables$Query$GetCurrentDeliveryMessages<TRes> {
  _CopyWithStubImpl$Variables$Query$GetCurrentDeliveryMessages(this._res);

  TRes _res;

  call({int? driver_id}) => _res;
}

class Query$GetCurrentDeliveryMessages {
  Query$GetCurrentDeliveryMessages({
    required this.delivery_messages,
    required this.$__typename,
  });

  factory Query$GetCurrentDeliveryMessages.fromJson(Map<String, dynamic> json) {
    final l$delivery_messages = json['delivery_messages'];
    final l$$__typename = json['__typename'];
    return Query$GetCurrentDeliveryMessages(
      delivery_messages: (l$delivery_messages as List<dynamic>)
          .map((e) =>
              Query$GetCurrentDeliveryMessages$delivery_messages.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$GetCurrentDeliveryMessages$delivery_messages>
      delivery_messages;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_messages = delivery_messages;
    _resultData['delivery_messages'] =
        l$delivery_messages.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_messages = delivery_messages;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_messages.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetCurrentDeliveryMessages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_messages = delivery_messages;
    final lOther$delivery_messages = other.delivery_messages;
    if (l$delivery_messages.length != lOther$delivery_messages.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_messages.length; i++) {
      final l$delivery_messages$entry = l$delivery_messages[i];
      final lOther$delivery_messages$entry = lOther$delivery_messages[i];
      if (l$delivery_messages$entry != lOther$delivery_messages$entry) {
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

extension UtilityExtension$Query$GetCurrentDeliveryMessages
    on Query$GetCurrentDeliveryMessages {
  CopyWith$Query$GetCurrentDeliveryMessages<Query$GetCurrentDeliveryMessages>
      get copyWith => CopyWith$Query$GetCurrentDeliveryMessages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCurrentDeliveryMessages<TRes> {
  factory CopyWith$Query$GetCurrentDeliveryMessages(
    Query$GetCurrentDeliveryMessages instance,
    TRes Function(Query$GetCurrentDeliveryMessages) then,
  ) = _CopyWithImpl$Query$GetCurrentDeliveryMessages;

  factory CopyWith$Query$GetCurrentDeliveryMessages.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCurrentDeliveryMessages;

  TRes call({
    List<Query$GetCurrentDeliveryMessages$delivery_messages>? delivery_messages,
    String? $__typename,
  });
  TRes delivery_messages(
      Iterable<Query$GetCurrentDeliveryMessages$delivery_messages> Function(
              Iterable<
                  CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages<
                      Query$GetCurrentDeliveryMessages$delivery_messages>>)
          _fn);
}

class _CopyWithImpl$Query$GetCurrentDeliveryMessages<TRes>
    implements CopyWith$Query$GetCurrentDeliveryMessages<TRes> {
  _CopyWithImpl$Query$GetCurrentDeliveryMessages(
    this._instance,
    this._then,
  );

  final Query$GetCurrentDeliveryMessages _instance;

  final TRes Function(Query$GetCurrentDeliveryMessages) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_messages = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCurrentDeliveryMessages(
        delivery_messages: delivery_messages == _undefined ||
                delivery_messages == null
            ? _instance.delivery_messages
            : (delivery_messages
                as List<Query$GetCurrentDeliveryMessages$delivery_messages>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_messages(
          Iterable<Query$GetCurrentDeliveryMessages$delivery_messages> Function(
                  Iterable<
                      CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages<
                          Query$GetCurrentDeliveryMessages$delivery_messages>>)
              _fn) =>
      call(
          delivery_messages: _fn(_instance.delivery_messages.map((e) =>
              CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetCurrentDeliveryMessages<TRes>
    implements CopyWith$Query$GetCurrentDeliveryMessages<TRes> {
  _CopyWithStubImpl$Query$GetCurrentDeliveryMessages(this._res);

  TRes _res;

  call({
    List<Query$GetCurrentDeliveryMessages$delivery_messages>? delivery_messages,
    String? $__typename,
  }) =>
      _res;
  delivery_messages(_fn) => _res;
}

const documentNodeQueryGetCurrentDeliveryMessages = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetCurrentDeliveryMessages'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driver_id')),
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
        name: NameNode(value: 'delivery_messages'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'distinct_on'),
            value: ListValueNode(values: [
              EnumValueNode(name: NameNode(value: 'phone_number')),
              EnumValueNode(name: NameNode(value: 'received_time')),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'received_time'),
                value: EnumValueNode(name: NameNode(value: 'desc')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'phone_number'),
                value: EnumValueNode(name: NameNode(value: 'desc')),
              ),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'driver_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'driver_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'finished_time'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_is_null'),
                    value: BooleanValueNode(value: true),
                  )
                ]),
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
            name: NameNode(value: 'entry'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone_number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'driver_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'received_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'finished_time'),
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
            name: NameNode(value: 'responded_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer'),
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
      
    ]),
  ),
]);
Query$GetCurrentDeliveryMessages _parserFn$Query$GetCurrentDeliveryMessages(
        Map<String, dynamic> data) =>
    Query$GetCurrentDeliveryMessages.fromJson(data);

class Options$Query$GetCurrentDeliveryMessages
    extends graphql.QueryOptions<Query$GetCurrentDeliveryMessages> {
  Options$Query$GetCurrentDeliveryMessages({
    String? operationName,
    required Variables$Query$GetCurrentDeliveryMessages variables,
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
          document: documentNodeQueryGetCurrentDeliveryMessages,
          parserFn: _parserFn$Query$GetCurrentDeliveryMessages,
        );
}

class WatchOptions$Query$GetCurrentDeliveryMessages
    extends graphql.WatchQueryOptions<Query$GetCurrentDeliveryMessages> {
  WatchOptions$Query$GetCurrentDeliveryMessages({
    String? operationName,
    required Variables$Query$GetCurrentDeliveryMessages variables,
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
          document: documentNodeQueryGetCurrentDeliveryMessages,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetCurrentDeliveryMessages,
        );
}

class FetchMoreOptions$Query$GetCurrentDeliveryMessages
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetCurrentDeliveryMessages({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetCurrentDeliveryMessages variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetCurrentDeliveryMessages,
        );
}

extension ClientExtension$Query$GetCurrentDeliveryMessages
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetCurrentDeliveryMessages>>
      query$GetCurrentDeliveryMessages(
              Options$Query$GetCurrentDeliveryMessages options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetCurrentDeliveryMessages>
      watchQuery$GetCurrentDeliveryMessages(
              WatchOptions$Query$GetCurrentDeliveryMessages options) =>
          this.watchQuery(options);
  void writeQuery$GetCurrentDeliveryMessages({
    required Query$GetCurrentDeliveryMessages data,
    required Variables$Query$GetCurrentDeliveryMessages variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetCurrentDeliveryMessages),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetCurrentDeliveryMessages? readQuery$GetCurrentDeliveryMessages({
    required Variables$Query$GetCurrentDeliveryMessages variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryGetCurrentDeliveryMessages),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetCurrentDeliveryMessages.fromJson(result);
  }
}

class Query$GetCurrentDeliveryMessages$delivery_messages {
  Query$GetCurrentDeliveryMessages$delivery_messages({
    required this.id,
    required this.entry,
    required this.phone_number,
    this.driver_id,
    required this.received_time,
    this.finished_time,
    this.user_id,
    this.responded_time,
    this.customer,
    required this.$__typename,
  });

  factory Query$GetCurrentDeliveryMessages$delivery_messages.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$entry = json['entry'];
    final l$phone_number = json['phone_number'];
    final l$driver_id = json['driver_id'];
    final l$received_time = json['received_time'];
    final l$finished_time = json['finished_time'];
    final l$user_id = json['user_id'];
    final l$responded_time = json['responded_time'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$GetCurrentDeliveryMessages$delivery_messages(
      id: (l$id as int),
      entry: mapFromJson(l$entry),
      phone_number: (l$phone_number as String),
      driver_id: (l$driver_id as int?),
      received_time: (l$received_time as String),
      finished_time: (l$finished_time as String?),
      user_id: (l$user_id as int?),
      responded_time: (l$responded_time as String?),
      customer: l$customer == null
          ? null
          : Query$GetCurrentDeliveryMessages$delivery_messages$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic entry;

  final String phone_number;

  final int? driver_id;

  final String received_time;

  final String? finished_time;

  final int? user_id;

  final String? responded_time;

  final Query$GetCurrentDeliveryMessages$delivery_messages$customer? customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$entry = entry;
    _resultData['entry'] = mapToJson(l$entry);
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$driver_id = driver_id;
    _resultData['driver_id'] = l$driver_id;
    final l$received_time = received_time;
    _resultData['received_time'] = l$received_time;
    final l$finished_time = finished_time;
    _resultData['finished_time'] = l$finished_time;
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$responded_time = responded_time;
    _resultData['responded_time'] = l$responded_time;
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$entry = entry;
    final l$phone_number = phone_number;
    final l$driver_id = driver_id;
    final l$received_time = received_time;
    final l$finished_time = finished_time;
    final l$user_id = user_id;
    final l$responded_time = responded_time;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$entry,
      l$phone_number,
      l$driver_id,
      l$received_time,
      l$finished_time,
      l$user_id,
      l$responded_time,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetCurrentDeliveryMessages$delivery_messages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$entry = entry;
    final lOther$entry = other.entry;
    if (l$entry != lOther$entry) {
      return false;
    }
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
      return false;
    }
    final l$driver_id = driver_id;
    final lOther$driver_id = other.driver_id;
    if (l$driver_id != lOther$driver_id) {
      return false;
    }
    final l$received_time = received_time;
    final lOther$received_time = other.received_time;
    if (l$received_time != lOther$received_time) {
      return false;
    }
    final l$finished_time = finished_time;
    final lOther$finished_time = other.finished_time;
    if (l$finished_time != lOther$finished_time) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$responded_time = responded_time;
    final lOther$responded_time = other.responded_time;
    if (l$responded_time != lOther$responded_time) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
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

extension UtilityExtension$Query$GetCurrentDeliveryMessages$delivery_messages
    on Query$GetCurrentDeliveryMessages$delivery_messages {
  CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages<
          Query$GetCurrentDeliveryMessages$delivery_messages>
      get copyWith =>
          CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages<
    TRes> {
  factory CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages(
    Query$GetCurrentDeliveryMessages$delivery_messages instance,
    TRes Function(Query$GetCurrentDeliveryMessages$delivery_messages) then,
  ) = _CopyWithImpl$Query$GetCurrentDeliveryMessages$delivery_messages;

  factory CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetCurrentDeliveryMessages$delivery_messages;

  TRes call({
    int? id,
    dynamic? entry,
    String? phone_number,
    int? driver_id,
    String? received_time,
    String? finished_time,
    int? user_id,
    String? responded_time,
    Query$GetCurrentDeliveryMessages$delivery_messages$customer? customer,
    String? $__typename,
  });
  CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages$customer<TRes>
      get customer;
}

class _CopyWithImpl$Query$GetCurrentDeliveryMessages$delivery_messages<TRes>
    implements
        CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages<TRes> {
  _CopyWithImpl$Query$GetCurrentDeliveryMessages$delivery_messages(
    this._instance,
    this._then,
  );

  final Query$GetCurrentDeliveryMessages$delivery_messages _instance;

  final TRes Function(Query$GetCurrentDeliveryMessages$delivery_messages) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? entry = _undefined,
    Object? phone_number = _undefined,
    Object? driver_id = _undefined,
    Object? received_time = _undefined,
    Object? finished_time = _undefined,
    Object? user_id = _undefined,
    Object? responded_time = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCurrentDeliveryMessages$delivery_messages(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        entry: entry == _undefined || entry == null
            ? _instance.entry
            : (entry as dynamic),
        phone_number: phone_number == _undefined || phone_number == null
            ? _instance.phone_number
            : (phone_number as String),
        driver_id:
            driver_id == _undefined ? _instance.driver_id : (driver_id as int?),
        received_time: received_time == _undefined || received_time == null
            ? _instance.received_time
            : (received_time as String),
        finished_time: finished_time == _undefined
            ? _instance.finished_time
            : (finished_time as String?),
        user_id: user_id == _undefined ? _instance.user_id : (user_id as int?),
        responded_time: responded_time == _undefined
            ? _instance.responded_time
            : (responded_time as String?),
        customer: customer == _undefined
            ? _instance.customer
            : (customer
                as Query$GetCurrentDeliveryMessages$delivery_messages$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages$customer
            .stub(_then(_instance))
        : CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages$customer(
            local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$GetCurrentDeliveryMessages$delivery_messages<TRes>
    implements
        CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages<TRes> {
  _CopyWithStubImpl$Query$GetCurrentDeliveryMessages$delivery_messages(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? entry,
    String? phone_number,
    int? driver_id,
    String? received_time,
    String? finished_time,
    int? user_id,
    String? responded_time,
    Query$GetCurrentDeliveryMessages$delivery_messages$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages$customer<TRes>
      get customer =>
          CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages$customer
              .stub(_res);
}

class Query$GetCurrentDeliveryMessages$delivery_messages$customer {
  Query$GetCurrentDeliveryMessages$delivery_messages$customer({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$GetCurrentDeliveryMessages$delivery_messages$customer.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$GetCurrentDeliveryMessages$delivery_messages$customer(
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String? image;

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
            is Query$GetCurrentDeliveryMessages$delivery_messages$customer) ||
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

extension UtilityExtension$Query$GetCurrentDeliveryMessages$delivery_messages$customer
    on Query$GetCurrentDeliveryMessages$delivery_messages$customer {
  CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages$customer<
          Query$GetCurrentDeliveryMessages$delivery_messages$customer>
      get copyWith =>
          CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages$customer<
    TRes> {
  factory CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages$customer(
    Query$GetCurrentDeliveryMessages$delivery_messages$customer instance,
    TRes Function(Query$GetCurrentDeliveryMessages$delivery_messages$customer)
        then,
  ) = _CopyWithImpl$Query$GetCurrentDeliveryMessages$delivery_messages$customer;

  factory CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetCurrentDeliveryMessages$delivery_messages$customer;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetCurrentDeliveryMessages$delivery_messages$customer<
        TRes>
    implements
        CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages$customer<
            TRes> {
  _CopyWithImpl$Query$GetCurrentDeliveryMessages$delivery_messages$customer(
    this._instance,
    this._then,
  );

  final Query$GetCurrentDeliveryMessages$delivery_messages$customer _instance;

  final TRes Function(
      Query$GetCurrentDeliveryMessages$delivery_messages$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCurrentDeliveryMessages$delivery_messages$customer(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetCurrentDeliveryMessages$delivery_messages$customer<
        TRes>
    implements
        CopyWith$Query$GetCurrentDeliveryMessages$delivery_messages$customer<
            TRes> {
  _CopyWithStubImpl$Query$GetCurrentDeliveryMessages$delivery_messages$customer(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listenCurrentDeliveryMessages {
  factory Variables$Subscription$listenCurrentDeliveryMessages(
          {required int driver_id}) =>
      Variables$Subscription$listenCurrentDeliveryMessages._({
        r'driver_id': driver_id,
      });

  Variables$Subscription$listenCurrentDeliveryMessages._(this._$data);

  factory Variables$Subscription$listenCurrentDeliveryMessages.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$driver_id = data['driver_id'];
    result$data['driver_id'] = (l$driver_id as int);
    return Variables$Subscription$listenCurrentDeliveryMessages._(result$data);
  }

  Map<String, dynamic> _$data;

  int get driver_id => (_$data['driver_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$driver_id = driver_id;
    result$data['driver_id'] = l$driver_id;
    return result$data;
  }

  CopyWith$Variables$Subscription$listenCurrentDeliveryMessages<
          Variables$Subscription$listenCurrentDeliveryMessages>
      get copyWith =>
          CopyWith$Variables$Subscription$listenCurrentDeliveryMessages(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listenCurrentDeliveryMessages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driver_id = driver_id;
    final lOther$driver_id = other.driver_id;
    if (l$driver_id != lOther$driver_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$driver_id = driver_id;
    return Object.hashAll([l$driver_id]);
  }
}

abstract class CopyWith$Variables$Subscription$listenCurrentDeliveryMessages<
    TRes> {
  factory CopyWith$Variables$Subscription$listenCurrentDeliveryMessages(
    Variables$Subscription$listenCurrentDeliveryMessages instance,
    TRes Function(Variables$Subscription$listenCurrentDeliveryMessages) then,
  ) = _CopyWithImpl$Variables$Subscription$listenCurrentDeliveryMessages;

  factory CopyWith$Variables$Subscription$listenCurrentDeliveryMessages.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listenCurrentDeliveryMessages;

  TRes call({int? driver_id});
}

class _CopyWithImpl$Variables$Subscription$listenCurrentDeliveryMessages<TRes>
    implements
        CopyWith$Variables$Subscription$listenCurrentDeliveryMessages<TRes> {
  _CopyWithImpl$Variables$Subscription$listenCurrentDeliveryMessages(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listenCurrentDeliveryMessages _instance;

  final TRes Function(Variables$Subscription$listenCurrentDeliveryMessages)
      _then;

  static const _undefined = {};

  TRes call({Object? driver_id = _undefined}) =>
      _then(Variables$Subscription$listenCurrentDeliveryMessages._({
        ..._instance._$data,
        if (driver_id != _undefined && driver_id != null)
          'driver_id': (driver_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listenCurrentDeliveryMessages<
        TRes>
    implements
        CopyWith$Variables$Subscription$listenCurrentDeliveryMessages<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listenCurrentDeliveryMessages(
      this._res);

  TRes _res;

  call({int? driver_id}) => _res;
}

class Subscription$listenCurrentDeliveryMessages {
  Subscription$listenCurrentDeliveryMessages({
    required this.delivery_messages,
    required this.$__typename,
  });

  factory Subscription$listenCurrentDeliveryMessages.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_messages = json['delivery_messages'];
    final l$$__typename = json['__typename'];
    return Subscription$listenCurrentDeliveryMessages(
      delivery_messages: (l$delivery_messages as List<dynamic>)
          .map((e) =>
              Subscription$listenCurrentDeliveryMessages$delivery_messages
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$listenCurrentDeliveryMessages$delivery_messages>
      delivery_messages;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_messages = delivery_messages;
    _resultData['delivery_messages'] =
        l$delivery_messages.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_messages = delivery_messages;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_messages.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listenCurrentDeliveryMessages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_messages = delivery_messages;
    final lOther$delivery_messages = other.delivery_messages;
    if (l$delivery_messages.length != lOther$delivery_messages.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_messages.length; i++) {
      final l$delivery_messages$entry = l$delivery_messages[i];
      final lOther$delivery_messages$entry = lOther$delivery_messages[i];
      if (l$delivery_messages$entry != lOther$delivery_messages$entry) {
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

extension UtilityExtension$Subscription$listenCurrentDeliveryMessages
    on Subscription$listenCurrentDeliveryMessages {
  CopyWith$Subscription$listenCurrentDeliveryMessages<
          Subscription$listenCurrentDeliveryMessages>
      get copyWith => CopyWith$Subscription$listenCurrentDeliveryMessages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenCurrentDeliveryMessages<TRes> {
  factory CopyWith$Subscription$listenCurrentDeliveryMessages(
    Subscription$listenCurrentDeliveryMessages instance,
    TRes Function(Subscription$listenCurrentDeliveryMessages) then,
  ) = _CopyWithImpl$Subscription$listenCurrentDeliveryMessages;

  factory CopyWith$Subscription$listenCurrentDeliveryMessages.stub(TRes res) =
      _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages;

  TRes call({
    List<Subscription$listenCurrentDeliveryMessages$delivery_messages>?
        delivery_messages,
    String? $__typename,
  });
  TRes delivery_messages(
      Iterable<Subscription$listenCurrentDeliveryMessages$delivery_messages> Function(
              Iterable<
                  CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages<
                      Subscription$listenCurrentDeliveryMessages$delivery_messages>>)
          _fn);
}

class _CopyWithImpl$Subscription$listenCurrentDeliveryMessages<TRes>
    implements CopyWith$Subscription$listenCurrentDeliveryMessages<TRes> {
  _CopyWithImpl$Subscription$listenCurrentDeliveryMessages(
    this._instance,
    this._then,
  );

  final Subscription$listenCurrentDeliveryMessages _instance;

  final TRes Function(Subscription$listenCurrentDeliveryMessages) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_messages = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenCurrentDeliveryMessages(
        delivery_messages: delivery_messages == _undefined ||
                delivery_messages == null
            ? _instance.delivery_messages
            : (delivery_messages as List<
                Subscription$listenCurrentDeliveryMessages$delivery_messages>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_messages(
          Iterable<Subscription$listenCurrentDeliveryMessages$delivery_messages> Function(
                  Iterable<
                      CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages<
                          Subscription$listenCurrentDeliveryMessages$delivery_messages>>)
              _fn) =>
      call(
          delivery_messages: _fn(_instance.delivery_messages.map((e) =>
              CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages<TRes>
    implements CopyWith$Subscription$listenCurrentDeliveryMessages<TRes> {
  _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages(this._res);

  TRes _res;

  call({
    List<Subscription$listenCurrentDeliveryMessages$delivery_messages>?
        delivery_messages,
    String? $__typename,
  }) =>
      _res;
  delivery_messages(_fn) => _res;
}

const documentNodeSubscriptionlistenCurrentDeliveryMessages =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listenCurrentDeliveryMessages'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driver_id')),
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
        name: NameNode(value: 'delivery_messages'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'distinct_on'),
            value: EnumValueNode(name: NameNode(value: 'phone_number')),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'driver_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'driver_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'finished_time'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_is_null'),
                    value: BooleanValueNode(value: true),
                  )
                ]),
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
            name: NameNode(value: 'entry'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone_number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'driver_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'received_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'finished_time'),
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
            name: NameNode(value: 'responded_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer'),
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
            name: NameNode(value: 'driver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user'),
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
                    name: NameNode(value: 'phone'),
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
Subscription$listenCurrentDeliveryMessages
    _parserFn$Subscription$listenCurrentDeliveryMessages(
            Map<String, dynamic> data) =>
        Subscription$listenCurrentDeliveryMessages.fromJson(data);

class Options$Subscription$listenCurrentDeliveryMessages extends graphql
    .SubscriptionOptions<Subscription$listenCurrentDeliveryMessages> {
  Options$Subscription$listenCurrentDeliveryMessages({
    String? operationName,
    required Variables$Subscription$listenCurrentDeliveryMessages variables,
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
          document: documentNodeSubscriptionlistenCurrentDeliveryMessages,
          parserFn: _parserFn$Subscription$listenCurrentDeliveryMessages,
        );
}

class WatchOptions$Subscription$listenCurrentDeliveryMessages extends graphql
    .WatchQueryOptions<Subscription$listenCurrentDeliveryMessages> {
  WatchOptions$Subscription$listenCurrentDeliveryMessages({
    String? operationName,
    required Variables$Subscription$listenCurrentDeliveryMessages variables,
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
          document: documentNodeSubscriptionlistenCurrentDeliveryMessages,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listenCurrentDeliveryMessages,
        );
}

class FetchMoreOptions$Subscription$listenCurrentDeliveryMessages
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listenCurrentDeliveryMessages({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listenCurrentDeliveryMessages variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlistenCurrentDeliveryMessages,
        );
}

extension ClientExtension$Subscription$listenCurrentDeliveryMessages
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listenCurrentDeliveryMessages>>
      subscribe$listenCurrentDeliveryMessages(
              Options$Subscription$listenCurrentDeliveryMessages options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listenCurrentDeliveryMessages>
      watchSubscription$listenCurrentDeliveryMessages(
              WatchOptions$Subscription$listenCurrentDeliveryMessages
                  options) =>
          this.watchQuery(options);
}

class Subscription$listenCurrentDeliveryMessages$delivery_messages {
  Subscription$listenCurrentDeliveryMessages$delivery_messages({
    required this.id,
    required this.entry,
    required this.phone_number,
    this.driver_id,
    required this.received_time,
    this.finished_time,
    this.user_id,
    this.responded_time,
    this.customer,
    this.driver,
    required this.$__typename,
  });

  factory Subscription$listenCurrentDeliveryMessages$delivery_messages.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$entry = json['entry'];
    final l$phone_number = json['phone_number'];
    final l$driver_id = json['driver_id'];
    final l$received_time = json['received_time'];
    final l$finished_time = json['finished_time'];
    final l$user_id = json['user_id'];
    final l$responded_time = json['responded_time'];
    final l$customer = json['customer'];
    final l$driver = json['driver'];
    final l$$__typename = json['__typename'];
    return Subscription$listenCurrentDeliveryMessages$delivery_messages(
      id: (l$id as int),
      entry: mapFromJson(l$entry),
      phone_number: (l$phone_number as String),
      driver_id: (l$driver_id as int?),
      received_time: (l$received_time as String),
      finished_time: (l$finished_time as String?),
      user_id: (l$user_id as int?),
      responded_time: (l$responded_time as String?),
      customer: l$customer == null
          ? null
          : Subscription$listenCurrentDeliveryMessages$delivery_messages$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      driver: l$driver == null
          ? null
          : Subscription$listenCurrentDeliveryMessages$delivery_messages$driver
              .fromJson((l$driver as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic entry;

  final String phone_number;

  final int? driver_id;

  final String received_time;

  final String? finished_time;

  final int? user_id;

  final String? responded_time;

  final Subscription$listenCurrentDeliveryMessages$delivery_messages$customer?
      customer;

  final Subscription$listenCurrentDeliveryMessages$delivery_messages$driver?
      driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$entry = entry;
    _resultData['entry'] = mapToJson(l$entry);
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$driver_id = driver_id;
    _resultData['driver_id'] = l$driver_id;
    final l$received_time = received_time;
    _resultData['received_time'] = l$received_time;
    final l$finished_time = finished_time;
    _resultData['finished_time'] = l$finished_time;
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$responded_time = responded_time;
    _resultData['responded_time'] = l$responded_time;
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$driver = driver;
    _resultData['driver'] = l$driver?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$entry = entry;
    final l$phone_number = phone_number;
    final l$driver_id = driver_id;
    final l$received_time = received_time;
    final l$finished_time = finished_time;
    final l$user_id = user_id;
    final l$responded_time = responded_time;
    final l$customer = customer;
    final l$driver = driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$entry,
      l$phone_number,
      l$driver_id,
      l$received_time,
      l$finished_time,
      l$user_id,
      l$responded_time,
      l$customer,
      l$driver,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listenCurrentDeliveryMessages$delivery_messages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$entry = entry;
    final lOther$entry = other.entry;
    if (l$entry != lOther$entry) {
      return false;
    }
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
      return false;
    }
    final l$driver_id = driver_id;
    final lOther$driver_id = other.driver_id;
    if (l$driver_id != lOther$driver_id) {
      return false;
    }
    final l$received_time = received_time;
    final lOther$received_time = other.received_time;
    if (l$received_time != lOther$received_time) {
      return false;
    }
    final l$finished_time = finished_time;
    final lOther$finished_time = other.finished_time;
    if (l$finished_time != lOther$finished_time) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$responded_time = responded_time;
    final lOther$responded_time = other.responded_time;
    if (l$responded_time != lOther$responded_time) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$driver = driver;
    final lOther$driver = other.driver;
    if (l$driver != lOther$driver) {
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

extension UtilityExtension$Subscription$listenCurrentDeliveryMessages$delivery_messages
    on Subscription$listenCurrentDeliveryMessages$delivery_messages {
  CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages<
          Subscription$listenCurrentDeliveryMessages$delivery_messages>
      get copyWith =>
          CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages<
    TRes> {
  factory CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages(
    Subscription$listenCurrentDeliveryMessages$delivery_messages instance,
    TRes Function(Subscription$listenCurrentDeliveryMessages$delivery_messages)
        then,
  ) = _CopyWithImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages;

  factory CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages;

  TRes call({
    int? id,
    dynamic? entry,
    String? phone_number,
    int? driver_id,
    String? received_time,
    String? finished_time,
    int? user_id,
    String? responded_time,
    Subscription$listenCurrentDeliveryMessages$delivery_messages$customer?
        customer,
    Subscription$listenCurrentDeliveryMessages$delivery_messages$driver? driver,
    String? $__typename,
  });
  CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer<
      TRes> get customer;
  CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver<
      TRes> get driver;
}

class _CopyWithImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages<
        TRes>
    implements
        CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages<
            TRes> {
  _CopyWithImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages(
    this._instance,
    this._then,
  );

  final Subscription$listenCurrentDeliveryMessages$delivery_messages _instance;

  final TRes Function(
      Subscription$listenCurrentDeliveryMessages$delivery_messages) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? entry = _undefined,
    Object? phone_number = _undefined,
    Object? driver_id = _undefined,
    Object? received_time = _undefined,
    Object? finished_time = _undefined,
    Object? user_id = _undefined,
    Object? responded_time = _undefined,
    Object? customer = _undefined,
    Object? driver = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenCurrentDeliveryMessages$delivery_messages(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        entry: entry == _undefined || entry == null
            ? _instance.entry
            : (entry as dynamic),
        phone_number: phone_number == _undefined || phone_number == null
            ? _instance.phone_number
            : (phone_number as String),
        driver_id:
            driver_id == _undefined ? _instance.driver_id : (driver_id as int?),
        received_time: received_time == _undefined || received_time == null
            ? _instance.received_time
            : (received_time as String),
        finished_time: finished_time == _undefined
            ? _instance.finished_time
            : (finished_time as String?),
        user_id: user_id == _undefined ? _instance.user_id : (user_id as int?),
        responded_time: responded_time == _undefined
            ? _instance.responded_time
            : (responded_time as String?),
        customer: customer == _undefined
            ? _instance.customer
            : (customer
                as Subscription$listenCurrentDeliveryMessages$delivery_messages$customer?),
        driver: driver == _undefined
            ? _instance.driver
            : (driver
                as Subscription$listenCurrentDeliveryMessages$delivery_messages$driver?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer
            .stub(_then(_instance))
        : CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer(
            local$customer, (e) => call(customer: e));
  }

  CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver<
      TRes> get driver {
    final local$driver = _instance.driver;
    return local$driver == null
        ? CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver
            .stub(_then(_instance))
        : CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver(
            local$driver, (e) => call(driver: e));
  }
}

class _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages<
        TRes>
    implements
        CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages<
            TRes> {
  _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? entry,
    String? phone_number,
    int? driver_id,
    String? received_time,
    String? finished_time,
    int? user_id,
    String? responded_time,
    Subscription$listenCurrentDeliveryMessages$delivery_messages$customer?
        customer,
    Subscription$listenCurrentDeliveryMessages$delivery_messages$driver? driver,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer
              .stub(_res);
  CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver<
          TRes>
      get driver =>
          CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver
              .stub(_res);
}

class Subscription$listenCurrentDeliveryMessages$delivery_messages$customer {
  Subscription$listenCurrentDeliveryMessages$delivery_messages$customer({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$listenCurrentDeliveryMessages$delivery_messages$customer.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listenCurrentDeliveryMessages$delivery_messages$customer(
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String? image;

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
            is Subscription$listenCurrentDeliveryMessages$delivery_messages$customer) ||
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

extension UtilityExtension$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer
    on Subscription$listenCurrentDeliveryMessages$delivery_messages$customer {
  CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer<
          Subscription$listenCurrentDeliveryMessages$delivery_messages$customer>
      get copyWith =>
          CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer<
    TRes> {
  factory CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer(
    Subscription$listenCurrentDeliveryMessages$delivery_messages$customer
        instance,
    TRes Function(
            Subscription$listenCurrentDeliveryMessages$delivery_messages$customer)
        then,
  ) = _CopyWithImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer;

  factory CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer<
        TRes>
    implements
        CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer<
            TRes> {
  _CopyWithImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer(
    this._instance,
    this._then,
  );

  final Subscription$listenCurrentDeliveryMessages$delivery_messages$customer
      _instance;

  final TRes Function(
          Subscription$listenCurrentDeliveryMessages$delivery_messages$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenCurrentDeliveryMessages$delivery_messages$customer(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer<
        TRes>
    implements
        CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$customer(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listenCurrentDeliveryMessages$delivery_messages$driver {
  Subscription$listenCurrentDeliveryMessages$delivery_messages$driver({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listenCurrentDeliveryMessages$delivery_messages$driver.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listenCurrentDeliveryMessages$delivery_messages$driver(
      user:
          Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listenCurrentDeliveryMessages$delivery_messages$driver) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver
    on Subscription$listenCurrentDeliveryMessages$delivery_messages$driver {
  CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver<
          Subscription$listenCurrentDeliveryMessages$delivery_messages$driver>
      get copyWith =>
          CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver<
    TRes> {
  factory CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver(
    Subscription$listenCurrentDeliveryMessages$delivery_messages$driver
        instance,
    TRes Function(
            Subscription$listenCurrentDeliveryMessages$delivery_messages$driver)
        then,
  ) = _CopyWithImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver;

  factory CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver;

  TRes call({
    Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver<
        TRes>
    implements
        CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver<
            TRes> {
  _CopyWithImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver(
    this._instance,
    this._then,
  );

  final Subscription$listenCurrentDeliveryMessages$delivery_messages$driver
      _instance;

  final TRes Function(
          Subscription$listenCurrentDeliveryMessages$delivery_messages$driver)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenCurrentDeliveryMessages$delivery_messages$driver(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver<
        TRes>
    implements
        CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver<
            TRes> {
  _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver(
      this._res);

  TRes _res;

  call({
    Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user<
          TRes>
      get user =>
          CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user
              .stub(_res);
}

class Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user {
  Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user({
    this.name,
    this.phone,
    required this.$__typename,
  });

  factory Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$phone = json['phone'];
    final l$$__typename = json['__typename'];
    return Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user(
      name: (l$name as String?),
      phone: (l$phone as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String? phone;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$phone = phone;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$phone,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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

extension UtilityExtension$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user
    on Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user {
  CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user<
          Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user>
      get copyWith =>
          CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user<
    TRes> {
  factory CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user(
    Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user
        instance,
    TRes Function(
            Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user)
        then,
  ) = _CopyWithImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user;

  factory CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user;

  TRes call({
    String? name,
    String? phone,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user<
        TRes>
    implements
        CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user<
            TRes> {
  _CopyWithImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user(
    this._instance,
    this._then,
  );

  final Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user
      _instance;

  final TRes Function(
          Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? phone = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user(
        name: name == _undefined ? _instance.name : (name as String?),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user<
        TRes>
    implements
        CopyWith$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listenCurrentDeliveryMessages$delivery_messages$driver$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? phone,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetOpenDeliveryMessages {
  Query$GetOpenDeliveryMessages({
    required this.delivery_messages,
    required this.$__typename,
  });

  factory Query$GetOpenDeliveryMessages.fromJson(Map<String, dynamic> json) {
    final l$delivery_messages = json['delivery_messages'];
    final l$$__typename = json['__typename'];
    return Query$GetOpenDeliveryMessages(
      delivery_messages: (l$delivery_messages as List<dynamic>)
          .map((e) => Query$GetOpenDeliveryMessages$delivery_messages.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$GetOpenDeliveryMessages$delivery_messages> delivery_messages;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_messages = delivery_messages;
    _resultData['delivery_messages'] =
        l$delivery_messages.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_messages = delivery_messages;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_messages.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetOpenDeliveryMessages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_messages = delivery_messages;
    final lOther$delivery_messages = other.delivery_messages;
    if (l$delivery_messages.length != lOther$delivery_messages.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_messages.length; i++) {
      final l$delivery_messages$entry = l$delivery_messages[i];
      final lOther$delivery_messages$entry = lOther$delivery_messages[i];
      if (l$delivery_messages$entry != lOther$delivery_messages$entry) {
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

extension UtilityExtension$Query$GetOpenDeliveryMessages
    on Query$GetOpenDeliveryMessages {
  CopyWith$Query$GetOpenDeliveryMessages<Query$GetOpenDeliveryMessages>
      get copyWith => CopyWith$Query$GetOpenDeliveryMessages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetOpenDeliveryMessages<TRes> {
  factory CopyWith$Query$GetOpenDeliveryMessages(
    Query$GetOpenDeliveryMessages instance,
    TRes Function(Query$GetOpenDeliveryMessages) then,
  ) = _CopyWithImpl$Query$GetOpenDeliveryMessages;

  factory CopyWith$Query$GetOpenDeliveryMessages.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOpenDeliveryMessages;

  TRes call({
    List<Query$GetOpenDeliveryMessages$delivery_messages>? delivery_messages,
    String? $__typename,
  });
  TRes delivery_messages(
      Iterable<Query$GetOpenDeliveryMessages$delivery_messages> Function(
              Iterable<
                  CopyWith$Query$GetOpenDeliveryMessages$delivery_messages<
                      Query$GetOpenDeliveryMessages$delivery_messages>>)
          _fn);
}

class _CopyWithImpl$Query$GetOpenDeliveryMessages<TRes>
    implements CopyWith$Query$GetOpenDeliveryMessages<TRes> {
  _CopyWithImpl$Query$GetOpenDeliveryMessages(
    this._instance,
    this._then,
  );

  final Query$GetOpenDeliveryMessages _instance;

  final TRes Function(Query$GetOpenDeliveryMessages) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_messages = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetOpenDeliveryMessages(
        delivery_messages:
            delivery_messages == _undefined || delivery_messages == null
                ? _instance.delivery_messages
                : (delivery_messages
                    as List<Query$GetOpenDeliveryMessages$delivery_messages>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_messages(
          Iterable<Query$GetOpenDeliveryMessages$delivery_messages> Function(
                  Iterable<
                      CopyWith$Query$GetOpenDeliveryMessages$delivery_messages<
                          Query$GetOpenDeliveryMessages$delivery_messages>>)
              _fn) =>
      call(
          delivery_messages: _fn(_instance.delivery_messages.map(
              (e) => CopyWith$Query$GetOpenDeliveryMessages$delivery_messages(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetOpenDeliveryMessages<TRes>
    implements CopyWith$Query$GetOpenDeliveryMessages<TRes> {
  _CopyWithStubImpl$Query$GetOpenDeliveryMessages(this._res);

  TRes _res;

  call({
    List<Query$GetOpenDeliveryMessages$delivery_messages>? delivery_messages,
    String? $__typename,
  }) =>
      _res;
  delivery_messages(_fn) => _res;
}

const documentNodeQueryGetOpenDeliveryMessages = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetOpenDeliveryMessages'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_messages'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'distinct_on'),
            value: EnumValueNode(name: NameNode(value: 'phone_number')),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: '_and'),
                value: ListValueNode(values: [
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'responded_time'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: '_is_null'),
                          value: BooleanValueNode(value: true),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: '_not'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: '_and'),
                          value: ListValueNode(values: [
                            ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: 'driver_id'),
                                value: ObjectValueNode(fields: [
                                  ObjectFieldNode(
                                    name: NameNode(value: '_is_null'),
                                    value: BooleanValueNode(value: false),
                                  )
                                ]),
                              )
                            ]),
                            ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: 'finished_time'),
                                value: ObjectValueNode(fields: [
                                  ObjectFieldNode(
                                    name: NameNode(value: '_is_null'),
                                    value: BooleanValueNode(value: true),
                                  )
                                ]),
                              )
                            ]),
                          ]),
                        )
                      ]),
                    )
                  ]),
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
            name: NameNode(value: 'entry'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone_number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'driver_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'received_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'finished_time'),
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
            name: NameNode(value: 'responded_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer'),
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
      
    ]),
  ),
]);
Query$GetOpenDeliveryMessages _parserFn$Query$GetOpenDeliveryMessages(
        Map<String, dynamic> data) =>
    Query$GetOpenDeliveryMessages.fromJson(data);

class Options$Query$GetOpenDeliveryMessages
    extends graphql.QueryOptions<Query$GetOpenDeliveryMessages> {
  Options$Query$GetOpenDeliveryMessages({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryGetOpenDeliveryMessages,
          parserFn: _parserFn$Query$GetOpenDeliveryMessages,
        );
}

class WatchOptions$Query$GetOpenDeliveryMessages
    extends graphql.WatchQueryOptions<Query$GetOpenDeliveryMessages> {
  WatchOptions$Query$GetOpenDeliveryMessages({
    String? operationName,
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
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryGetOpenDeliveryMessages,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetOpenDeliveryMessages,
        );
}

class FetchMoreOptions$Query$GetOpenDeliveryMessages
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetOpenDeliveryMessages(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetOpenDeliveryMessages,
        );
}

extension ClientExtension$Query$GetOpenDeliveryMessages
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetOpenDeliveryMessages>>
      query$GetOpenDeliveryMessages(
              [Options$Query$GetOpenDeliveryMessages? options]) async =>
          await this.query(options ?? Options$Query$GetOpenDeliveryMessages());
  graphql.ObservableQuery<
      Query$GetOpenDeliveryMessages> watchQuery$GetOpenDeliveryMessages(
          [WatchOptions$Query$GetOpenDeliveryMessages? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetOpenDeliveryMessages());
  void writeQuery$GetOpenDeliveryMessages({
    required Query$GetOpenDeliveryMessages data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryGetOpenDeliveryMessages)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetOpenDeliveryMessages? readQuery$GetOpenDeliveryMessages(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetOpenDeliveryMessages)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetOpenDeliveryMessages.fromJson(result);
  }
}

class Query$GetOpenDeliveryMessages$delivery_messages {
  Query$GetOpenDeliveryMessages$delivery_messages({
    required this.id,
    required this.entry,
    required this.phone_number,
    this.driver_id,
    required this.received_time,
    this.finished_time,
    this.user_id,
    this.responded_time,
    this.customer,
    required this.$__typename,
  });

  factory Query$GetOpenDeliveryMessages$delivery_messages.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$entry = json['entry'];
    final l$phone_number = json['phone_number'];
    final l$driver_id = json['driver_id'];
    final l$received_time = json['received_time'];
    final l$finished_time = json['finished_time'];
    final l$user_id = json['user_id'];
    final l$responded_time = json['responded_time'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$GetOpenDeliveryMessages$delivery_messages(
      id: (l$id as int),
      entry: mapFromJson(l$entry),
      phone_number: (l$phone_number as String),
      driver_id: (l$driver_id as int?),
      received_time: (l$received_time as String),
      finished_time: (l$finished_time as String?),
      user_id: (l$user_id as int?),
      responded_time: (l$responded_time as String?),
      customer: l$customer == null
          ? null
          : Query$GetOpenDeliveryMessages$delivery_messages$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic entry;

  final String phone_number;

  final int? driver_id;

  final String received_time;

  final String? finished_time;

  final int? user_id;

  final String? responded_time;

  final Query$GetOpenDeliveryMessages$delivery_messages$customer? customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$entry = entry;
    _resultData['entry'] = mapToJson(l$entry);
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$driver_id = driver_id;
    _resultData['driver_id'] = l$driver_id;
    final l$received_time = received_time;
    _resultData['received_time'] = l$received_time;
    final l$finished_time = finished_time;
    _resultData['finished_time'] = l$finished_time;
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$responded_time = responded_time;
    _resultData['responded_time'] = l$responded_time;
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$entry = entry;
    final l$phone_number = phone_number;
    final l$driver_id = driver_id;
    final l$received_time = received_time;
    final l$finished_time = finished_time;
    final l$user_id = user_id;
    final l$responded_time = responded_time;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$entry,
      l$phone_number,
      l$driver_id,
      l$received_time,
      l$finished_time,
      l$user_id,
      l$responded_time,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetOpenDeliveryMessages$delivery_messages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$entry = entry;
    final lOther$entry = other.entry;
    if (l$entry != lOther$entry) {
      return false;
    }
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
      return false;
    }
    final l$driver_id = driver_id;
    final lOther$driver_id = other.driver_id;
    if (l$driver_id != lOther$driver_id) {
      return false;
    }
    final l$received_time = received_time;
    final lOther$received_time = other.received_time;
    if (l$received_time != lOther$received_time) {
      return false;
    }
    final l$finished_time = finished_time;
    final lOther$finished_time = other.finished_time;
    if (l$finished_time != lOther$finished_time) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$responded_time = responded_time;
    final lOther$responded_time = other.responded_time;
    if (l$responded_time != lOther$responded_time) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
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

extension UtilityExtension$Query$GetOpenDeliveryMessages$delivery_messages
    on Query$GetOpenDeliveryMessages$delivery_messages {
  CopyWith$Query$GetOpenDeliveryMessages$delivery_messages<
          Query$GetOpenDeliveryMessages$delivery_messages>
      get copyWith => CopyWith$Query$GetOpenDeliveryMessages$delivery_messages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetOpenDeliveryMessages$delivery_messages<TRes> {
  factory CopyWith$Query$GetOpenDeliveryMessages$delivery_messages(
    Query$GetOpenDeliveryMessages$delivery_messages instance,
    TRes Function(Query$GetOpenDeliveryMessages$delivery_messages) then,
  ) = _CopyWithImpl$Query$GetOpenDeliveryMessages$delivery_messages;

  factory CopyWith$Query$GetOpenDeliveryMessages$delivery_messages.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetOpenDeliveryMessages$delivery_messages;

  TRes call({
    int? id,
    dynamic? entry,
    String? phone_number,
    int? driver_id,
    String? received_time,
    String? finished_time,
    int? user_id,
    String? responded_time,
    Query$GetOpenDeliveryMessages$delivery_messages$customer? customer,
    String? $__typename,
  });
  CopyWith$Query$GetOpenDeliveryMessages$delivery_messages$customer<TRes>
      get customer;
}

class _CopyWithImpl$Query$GetOpenDeliveryMessages$delivery_messages<TRes>
    implements CopyWith$Query$GetOpenDeliveryMessages$delivery_messages<TRes> {
  _CopyWithImpl$Query$GetOpenDeliveryMessages$delivery_messages(
    this._instance,
    this._then,
  );

  final Query$GetOpenDeliveryMessages$delivery_messages _instance;

  final TRes Function(Query$GetOpenDeliveryMessages$delivery_messages) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? entry = _undefined,
    Object? phone_number = _undefined,
    Object? driver_id = _undefined,
    Object? received_time = _undefined,
    Object? finished_time = _undefined,
    Object? user_id = _undefined,
    Object? responded_time = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetOpenDeliveryMessages$delivery_messages(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        entry: entry == _undefined || entry == null
            ? _instance.entry
            : (entry as dynamic),
        phone_number: phone_number == _undefined || phone_number == null
            ? _instance.phone_number
            : (phone_number as String),
        driver_id:
            driver_id == _undefined ? _instance.driver_id : (driver_id as int?),
        received_time: received_time == _undefined || received_time == null
            ? _instance.received_time
            : (received_time as String),
        finished_time: finished_time == _undefined
            ? _instance.finished_time
            : (finished_time as String?),
        user_id: user_id == _undefined ? _instance.user_id : (user_id as int?),
        responded_time: responded_time == _undefined
            ? _instance.responded_time
            : (responded_time as String?),
        customer: customer == _undefined
            ? _instance.customer
            : (customer
                as Query$GetOpenDeliveryMessages$delivery_messages$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetOpenDeliveryMessages$delivery_messages$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Query$GetOpenDeliveryMessages$delivery_messages$customer
            .stub(_then(_instance))
        : CopyWith$Query$GetOpenDeliveryMessages$delivery_messages$customer(
            local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$GetOpenDeliveryMessages$delivery_messages<TRes>
    implements CopyWith$Query$GetOpenDeliveryMessages$delivery_messages<TRes> {
  _CopyWithStubImpl$Query$GetOpenDeliveryMessages$delivery_messages(this._res);

  TRes _res;

  call({
    int? id,
    dynamic? entry,
    String? phone_number,
    int? driver_id,
    String? received_time,
    String? finished_time,
    int? user_id,
    String? responded_time,
    Query$GetOpenDeliveryMessages$delivery_messages$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetOpenDeliveryMessages$delivery_messages$customer<TRes>
      get customer =>
          CopyWith$Query$GetOpenDeliveryMessages$delivery_messages$customer
              .stub(_res);
}

class Query$GetOpenDeliveryMessages$delivery_messages$customer {
  Query$GetOpenDeliveryMessages$delivery_messages$customer({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$GetOpenDeliveryMessages$delivery_messages$customer.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$GetOpenDeliveryMessages$delivery_messages$customer(
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String? image;

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
    if (!(other is Query$GetOpenDeliveryMessages$delivery_messages$customer) ||
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

extension UtilityExtension$Query$GetOpenDeliveryMessages$delivery_messages$customer
    on Query$GetOpenDeliveryMessages$delivery_messages$customer {
  CopyWith$Query$GetOpenDeliveryMessages$delivery_messages$customer<
          Query$GetOpenDeliveryMessages$delivery_messages$customer>
      get copyWith =>
          CopyWith$Query$GetOpenDeliveryMessages$delivery_messages$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetOpenDeliveryMessages$delivery_messages$customer<
    TRes> {
  factory CopyWith$Query$GetOpenDeliveryMessages$delivery_messages$customer(
    Query$GetOpenDeliveryMessages$delivery_messages$customer instance,
    TRes Function(Query$GetOpenDeliveryMessages$delivery_messages$customer)
        then,
  ) = _CopyWithImpl$Query$GetOpenDeliveryMessages$delivery_messages$customer;

  factory CopyWith$Query$GetOpenDeliveryMessages$delivery_messages$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetOpenDeliveryMessages$delivery_messages$customer;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetOpenDeliveryMessages$delivery_messages$customer<
        TRes>
    implements
        CopyWith$Query$GetOpenDeliveryMessages$delivery_messages$customer<
            TRes> {
  _CopyWithImpl$Query$GetOpenDeliveryMessages$delivery_messages$customer(
    this._instance,
    this._then,
  );

  final Query$GetOpenDeliveryMessages$delivery_messages$customer _instance;

  final TRes Function(Query$GetOpenDeliveryMessages$delivery_messages$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetOpenDeliveryMessages$delivery_messages$customer(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetOpenDeliveryMessages$delivery_messages$customer<
        TRes>
    implements
        CopyWith$Query$GetOpenDeliveryMessages$delivery_messages$customer<
            TRes> {
  _CopyWithStubImpl$Query$GetOpenDeliveryMessages$delivery_messages$customer(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$ListenOpenDeliveryMessages {
  Subscription$ListenOpenDeliveryMessages({
    required this.delivery_messages,
    required this.$__typename,
  });

  factory Subscription$ListenOpenDeliveryMessages.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_messages = json['delivery_messages'];
    final l$$__typename = json['__typename'];
    return Subscription$ListenOpenDeliveryMessages(
      delivery_messages: (l$delivery_messages as List<dynamic>)
          .map((e) => Subscription$ListenOpenDeliveryMessages$delivery_messages
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$ListenOpenDeliveryMessages$delivery_messages>
      delivery_messages;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_messages = delivery_messages;
    _resultData['delivery_messages'] =
        l$delivery_messages.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_messages = delivery_messages;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_messages.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$ListenOpenDeliveryMessages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_messages = delivery_messages;
    final lOther$delivery_messages = other.delivery_messages;
    if (l$delivery_messages.length != lOther$delivery_messages.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_messages.length; i++) {
      final l$delivery_messages$entry = l$delivery_messages[i];
      final lOther$delivery_messages$entry = lOther$delivery_messages[i];
      if (l$delivery_messages$entry != lOther$delivery_messages$entry) {
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

extension UtilityExtension$Subscription$ListenOpenDeliveryMessages
    on Subscription$ListenOpenDeliveryMessages {
  CopyWith$Subscription$ListenOpenDeliveryMessages<
          Subscription$ListenOpenDeliveryMessages>
      get copyWith => CopyWith$Subscription$ListenOpenDeliveryMessages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenOpenDeliveryMessages<TRes> {
  factory CopyWith$Subscription$ListenOpenDeliveryMessages(
    Subscription$ListenOpenDeliveryMessages instance,
    TRes Function(Subscription$ListenOpenDeliveryMessages) then,
  ) = _CopyWithImpl$Subscription$ListenOpenDeliveryMessages;

  factory CopyWith$Subscription$ListenOpenDeliveryMessages.stub(TRes res) =
      _CopyWithStubImpl$Subscription$ListenOpenDeliveryMessages;

  TRes call({
    List<Subscription$ListenOpenDeliveryMessages$delivery_messages>?
        delivery_messages,
    String? $__typename,
  });
  TRes delivery_messages(
      Iterable<Subscription$ListenOpenDeliveryMessages$delivery_messages> Function(
              Iterable<
                  CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages<
                      Subscription$ListenOpenDeliveryMessages$delivery_messages>>)
          _fn);
}

class _CopyWithImpl$Subscription$ListenOpenDeliveryMessages<TRes>
    implements CopyWith$Subscription$ListenOpenDeliveryMessages<TRes> {
  _CopyWithImpl$Subscription$ListenOpenDeliveryMessages(
    this._instance,
    this._then,
  );

  final Subscription$ListenOpenDeliveryMessages _instance;

  final TRes Function(Subscription$ListenOpenDeliveryMessages) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_messages = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$ListenOpenDeliveryMessages(
        delivery_messages:
            delivery_messages == _undefined || delivery_messages == null
                ? _instance.delivery_messages
                : (delivery_messages as List<
                    Subscription$ListenOpenDeliveryMessages$delivery_messages>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_messages(
          Iterable<Subscription$ListenOpenDeliveryMessages$delivery_messages> Function(
                  Iterable<
                      CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages<
                          Subscription$ListenOpenDeliveryMessages$delivery_messages>>)
              _fn) =>
      call(
          delivery_messages: _fn(_instance.delivery_messages.map((e) =>
              CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$ListenOpenDeliveryMessages<TRes>
    implements CopyWith$Subscription$ListenOpenDeliveryMessages<TRes> {
  _CopyWithStubImpl$Subscription$ListenOpenDeliveryMessages(this._res);

  TRes _res;

  call({
    List<Subscription$ListenOpenDeliveryMessages$delivery_messages>?
        delivery_messages,
    String? $__typename,
  }) =>
      _res;
  delivery_messages(_fn) => _res;
}

const documentNodeSubscriptionListenOpenDeliveryMessages =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'ListenOpenDeliveryMessages'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_messages'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'distinct_on'),
            value: EnumValueNode(name: NameNode(value: 'phone_number')),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: '_and'),
                value: ListValueNode(values: [
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'responded_time'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: '_is_null'),
                          value: BooleanValueNode(value: true),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: '_not'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: '_and'),
                          value: ListValueNode(values: [
                            ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: 'driver_id'),
                                value: ObjectValueNode(fields: [
                                  ObjectFieldNode(
                                    name: NameNode(value: '_is_null'),
                                    value: BooleanValueNode(value: false),
                                  )
                                ]),
                              )
                            ]),
                            ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: 'finished_time'),
                                value: ObjectValueNode(fields: [
                                  ObjectFieldNode(
                                    name: NameNode(value: '_is_null'),
                                    value: BooleanValueNode(value: true),
                                  )
                                ]),
                              )
                            ]),
                          ]),
                        )
                      ]),
                    )
                  ]),
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
            name: NameNode(value: 'entry'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone_number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'driver_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'received_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'finished_time'),
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
            name: NameNode(value: 'responded_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer'),
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
      
    ]),
  ),
]);
Subscription$ListenOpenDeliveryMessages
    _parserFn$Subscription$ListenOpenDeliveryMessages(
            Map<String, dynamic> data) =>
        Subscription$ListenOpenDeliveryMessages.fromJson(data);

class Options$Subscription$ListenOpenDeliveryMessages extends graphql
    .SubscriptionOptions<Subscription$ListenOpenDeliveryMessages> {
  Options$Subscription$ListenOpenDeliveryMessages({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeSubscriptionListenOpenDeliveryMessages,
          parserFn: _parserFn$Subscription$ListenOpenDeliveryMessages,
        );
}

class WatchOptions$Subscription$ListenOpenDeliveryMessages
    extends graphql.WatchQueryOptions<Subscription$ListenOpenDeliveryMessages> {
  WatchOptions$Subscription$ListenOpenDeliveryMessages({
    String? operationName,
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
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeSubscriptionListenOpenDeliveryMessages,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$ListenOpenDeliveryMessages,
        );
}

class FetchMoreOptions$Subscription$ListenOpenDeliveryMessages
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$ListenOpenDeliveryMessages(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeSubscriptionListenOpenDeliveryMessages,
        );
}

extension ClientExtension$Subscription$ListenOpenDeliveryMessages
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$ListenOpenDeliveryMessages>>
      subscribe$ListenOpenDeliveryMessages(
              [Options$Subscription$ListenOpenDeliveryMessages? options]) =>
          this.subscribe(
              options ?? Options$Subscription$ListenOpenDeliveryMessages());
  graphql.ObservableQuery<Subscription$ListenOpenDeliveryMessages>
      watchSubscription$ListenOpenDeliveryMessages(
              [WatchOptions$Subscription$ListenOpenDeliveryMessages?
                  options]) =>
          this.watchQuery(options ??
              WatchOptions$Subscription$ListenOpenDeliveryMessages());
}

class Subscription$ListenOpenDeliveryMessages$delivery_messages {
  Subscription$ListenOpenDeliveryMessages$delivery_messages({
    required this.id,
    required this.entry,
    required this.phone_number,
    this.driver_id,
    required this.received_time,
    this.finished_time,
    this.user_id,
    this.responded_time,
    this.customer,
    required this.$__typename,
  });

  factory Subscription$ListenOpenDeliveryMessages$delivery_messages.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$entry = json['entry'];
    final l$phone_number = json['phone_number'];
    final l$driver_id = json['driver_id'];
    final l$received_time = json['received_time'];
    final l$finished_time = json['finished_time'];
    final l$user_id = json['user_id'];
    final l$responded_time = json['responded_time'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Subscription$ListenOpenDeliveryMessages$delivery_messages(
      id: (l$id as int),
      entry: mapFromJson(l$entry),
      phone_number: (l$phone_number as String),
      driver_id: (l$driver_id as int?),
      received_time: (l$received_time as String),
      finished_time: (l$finished_time as String?),
      user_id: (l$user_id as int?),
      responded_time: (l$responded_time as String?),
      customer: l$customer == null
          ? null
          : Subscription$ListenOpenDeliveryMessages$delivery_messages$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic entry;

  final String phone_number;

  final int? driver_id;

  final String received_time;

  final String? finished_time;

  final int? user_id;

  final String? responded_time;

  final Subscription$ListenOpenDeliveryMessages$delivery_messages$customer?
      customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$entry = entry;
    _resultData['entry'] = mapToJson(l$entry);
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$driver_id = driver_id;
    _resultData['driver_id'] = l$driver_id;
    final l$received_time = received_time;
    _resultData['received_time'] = l$received_time;
    final l$finished_time = finished_time;
    _resultData['finished_time'] = l$finished_time;
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$responded_time = responded_time;
    _resultData['responded_time'] = l$responded_time;
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$entry = entry;
    final l$phone_number = phone_number;
    final l$driver_id = driver_id;
    final l$received_time = received_time;
    final l$finished_time = finished_time;
    final l$user_id = user_id;
    final l$responded_time = responded_time;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$entry,
      l$phone_number,
      l$driver_id,
      l$received_time,
      l$finished_time,
      l$user_id,
      l$responded_time,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$ListenOpenDeliveryMessages$delivery_messages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$entry = entry;
    final lOther$entry = other.entry;
    if (l$entry != lOther$entry) {
      return false;
    }
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
      return false;
    }
    final l$driver_id = driver_id;
    final lOther$driver_id = other.driver_id;
    if (l$driver_id != lOther$driver_id) {
      return false;
    }
    final l$received_time = received_time;
    final lOther$received_time = other.received_time;
    if (l$received_time != lOther$received_time) {
      return false;
    }
    final l$finished_time = finished_time;
    final lOther$finished_time = other.finished_time;
    if (l$finished_time != lOther$finished_time) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$responded_time = responded_time;
    final lOther$responded_time = other.responded_time;
    if (l$responded_time != lOther$responded_time) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
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

extension UtilityExtension$Subscription$ListenOpenDeliveryMessages$delivery_messages
    on Subscription$ListenOpenDeliveryMessages$delivery_messages {
  CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages<
          Subscription$ListenOpenDeliveryMessages$delivery_messages>
      get copyWith =>
          CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages<
    TRes> {
  factory CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages(
    Subscription$ListenOpenDeliveryMessages$delivery_messages instance,
    TRes Function(Subscription$ListenOpenDeliveryMessages$delivery_messages)
        then,
  ) = _CopyWithImpl$Subscription$ListenOpenDeliveryMessages$delivery_messages;

  factory CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$ListenOpenDeliveryMessages$delivery_messages;

  TRes call({
    int? id,
    dynamic? entry,
    String? phone_number,
    int? driver_id,
    String? received_time,
    String? finished_time,
    int? user_id,
    String? responded_time,
    Subscription$ListenOpenDeliveryMessages$delivery_messages$customer?
        customer,
    String? $__typename,
  });
  CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer<
      TRes> get customer;
}

class _CopyWithImpl$Subscription$ListenOpenDeliveryMessages$delivery_messages<
        TRes>
    implements
        CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages<
            TRes> {
  _CopyWithImpl$Subscription$ListenOpenDeliveryMessages$delivery_messages(
    this._instance,
    this._then,
  );

  final Subscription$ListenOpenDeliveryMessages$delivery_messages _instance;

  final TRes Function(Subscription$ListenOpenDeliveryMessages$delivery_messages)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? entry = _undefined,
    Object? phone_number = _undefined,
    Object? driver_id = _undefined,
    Object? received_time = _undefined,
    Object? finished_time = _undefined,
    Object? user_id = _undefined,
    Object? responded_time = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$ListenOpenDeliveryMessages$delivery_messages(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        entry: entry == _undefined || entry == null
            ? _instance.entry
            : (entry as dynamic),
        phone_number: phone_number == _undefined || phone_number == null
            ? _instance.phone_number
            : (phone_number as String),
        driver_id:
            driver_id == _undefined ? _instance.driver_id : (driver_id as int?),
        received_time: received_time == _undefined || received_time == null
            ? _instance.received_time
            : (received_time as String),
        finished_time: finished_time == _undefined
            ? _instance.finished_time
            : (finished_time as String?),
        user_id: user_id == _undefined ? _instance.user_id : (user_id as int?),
        responded_time: responded_time == _undefined
            ? _instance.responded_time
            : (responded_time as String?),
        customer: customer == _undefined
            ? _instance.customer
            : (customer
                as Subscription$ListenOpenDeliveryMessages$delivery_messages$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer
            .stub(_then(_instance))
        : CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer(
            local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Subscription$ListenOpenDeliveryMessages$delivery_messages<
        TRes>
    implements
        CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages<
            TRes> {
  _CopyWithStubImpl$Subscription$ListenOpenDeliveryMessages$delivery_messages(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? entry,
    String? phone_number,
    int? driver_id,
    String? received_time,
    String? finished_time,
    int? user_id,
    String? responded_time,
    Subscription$ListenOpenDeliveryMessages$delivery_messages$customer?
        customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer
              .stub(_res);
}

class Subscription$ListenOpenDeliveryMessages$delivery_messages$customer {
  Subscription$ListenOpenDeliveryMessages$delivery_messages$customer({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$ListenOpenDeliveryMessages$delivery_messages$customer.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$ListenOpenDeliveryMessages$delivery_messages$customer(
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String? image;

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
            is Subscription$ListenOpenDeliveryMessages$delivery_messages$customer) ||
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

extension UtilityExtension$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer
    on Subscription$ListenOpenDeliveryMessages$delivery_messages$customer {
  CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer<
          Subscription$ListenOpenDeliveryMessages$delivery_messages$customer>
      get copyWith =>
          CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer<
    TRes> {
  factory CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer(
    Subscription$ListenOpenDeliveryMessages$delivery_messages$customer instance,
    TRes Function(
            Subscription$ListenOpenDeliveryMessages$delivery_messages$customer)
        then,
  ) = _CopyWithImpl$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer;

  factory CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer<
        TRes>
    implements
        CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer<
            TRes> {
  _CopyWithImpl$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer(
    this._instance,
    this._then,
  );

  final Subscription$ListenOpenDeliveryMessages$delivery_messages$customer
      _instance;

  final TRes Function(
      Subscription$ListenOpenDeliveryMessages$delivery_messages$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$ListenOpenDeliveryMessages$delivery_messages$customer(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer<
        TRes>
    implements
        CopyWith$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$ListenOpenDeliveryMessages$delivery_messages$customer(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetCustomerDeliveryMessages {
  factory Variables$Query$GetCustomerDeliveryMessages(
          {required String phone_number}) =>
      Variables$Query$GetCustomerDeliveryMessages._({
        r'phone_number': phone_number,
      });

  Variables$Query$GetCustomerDeliveryMessages._(this._$data);

  factory Variables$Query$GetCustomerDeliveryMessages.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$phone_number = data['phone_number'];
    result$data['phone_number'] = (l$phone_number as String);
    return Variables$Query$GetCustomerDeliveryMessages._(result$data);
  }

  Map<String, dynamic> _$data;

  String get phone_number => (_$data['phone_number'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$phone_number = phone_number;
    result$data['phone_number'] = l$phone_number;
    return result$data;
  }

  CopyWith$Variables$Query$GetCustomerDeliveryMessages<
          Variables$Query$GetCustomerDeliveryMessages>
      get copyWith => CopyWith$Variables$Query$GetCustomerDeliveryMessages(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetCustomerDeliveryMessages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$phone_number = phone_number;
    return Object.hashAll([l$phone_number]);
  }
}

abstract class CopyWith$Variables$Query$GetCustomerDeliveryMessages<TRes> {
  factory CopyWith$Variables$Query$GetCustomerDeliveryMessages(
    Variables$Query$GetCustomerDeliveryMessages instance,
    TRes Function(Variables$Query$GetCustomerDeliveryMessages) then,
  ) = _CopyWithImpl$Variables$Query$GetCustomerDeliveryMessages;

  factory CopyWith$Variables$Query$GetCustomerDeliveryMessages.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetCustomerDeliveryMessages;

  TRes call({String? phone_number});
}

class _CopyWithImpl$Variables$Query$GetCustomerDeliveryMessages<TRes>
    implements CopyWith$Variables$Query$GetCustomerDeliveryMessages<TRes> {
  _CopyWithImpl$Variables$Query$GetCustomerDeliveryMessages(
    this._instance,
    this._then,
  );

  final Variables$Query$GetCustomerDeliveryMessages _instance;

  final TRes Function(Variables$Query$GetCustomerDeliveryMessages) _then;

  static const _undefined = {};

  TRes call({Object? phone_number = _undefined}) =>
      _then(Variables$Query$GetCustomerDeliveryMessages._({
        ..._instance._$data,
        if (phone_number != _undefined && phone_number != null)
          'phone_number': (phone_number as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetCustomerDeliveryMessages<TRes>
    implements CopyWith$Variables$Query$GetCustomerDeliveryMessages<TRes> {
  _CopyWithStubImpl$Variables$Query$GetCustomerDeliveryMessages(this._res);

  TRes _res;

  call({String? phone_number}) => _res;
}

class Query$GetCustomerDeliveryMessages {
  Query$GetCustomerDeliveryMessages({
    required this.delivery_messages,
    required this.$__typename,
  });

  factory Query$GetCustomerDeliveryMessages.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_messages = json['delivery_messages'];
    final l$$__typename = json['__typename'];
    return Query$GetCustomerDeliveryMessages(
      delivery_messages: (l$delivery_messages as List<dynamic>)
          .map((e) =>
              Query$GetCustomerDeliveryMessages$delivery_messages.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$GetCustomerDeliveryMessages$delivery_messages>
      delivery_messages;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_messages = delivery_messages;
    _resultData['delivery_messages'] =
        l$delivery_messages.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_messages = delivery_messages;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_messages.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetCustomerDeliveryMessages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_messages = delivery_messages;
    final lOther$delivery_messages = other.delivery_messages;
    if (l$delivery_messages.length != lOther$delivery_messages.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_messages.length; i++) {
      final l$delivery_messages$entry = l$delivery_messages[i];
      final lOther$delivery_messages$entry = lOther$delivery_messages[i];
      if (l$delivery_messages$entry != lOther$delivery_messages$entry) {
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

extension UtilityExtension$Query$GetCustomerDeliveryMessages
    on Query$GetCustomerDeliveryMessages {
  CopyWith$Query$GetCustomerDeliveryMessages<Query$GetCustomerDeliveryMessages>
      get copyWith => CopyWith$Query$GetCustomerDeliveryMessages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCustomerDeliveryMessages<TRes> {
  factory CopyWith$Query$GetCustomerDeliveryMessages(
    Query$GetCustomerDeliveryMessages instance,
    TRes Function(Query$GetCustomerDeliveryMessages) then,
  ) = _CopyWithImpl$Query$GetCustomerDeliveryMessages;

  factory CopyWith$Query$GetCustomerDeliveryMessages.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCustomerDeliveryMessages;

  TRes call({
    List<Query$GetCustomerDeliveryMessages$delivery_messages>?
        delivery_messages,
    String? $__typename,
  });
  TRes delivery_messages(
      Iterable<Query$GetCustomerDeliveryMessages$delivery_messages> Function(
              Iterable<
                  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages<
                      Query$GetCustomerDeliveryMessages$delivery_messages>>)
          _fn);
}

class _CopyWithImpl$Query$GetCustomerDeliveryMessages<TRes>
    implements CopyWith$Query$GetCustomerDeliveryMessages<TRes> {
  _CopyWithImpl$Query$GetCustomerDeliveryMessages(
    this._instance,
    this._then,
  );

  final Query$GetCustomerDeliveryMessages _instance;

  final TRes Function(Query$GetCustomerDeliveryMessages) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_messages = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCustomerDeliveryMessages(
        delivery_messages: delivery_messages == _undefined ||
                delivery_messages == null
            ? _instance.delivery_messages
            : (delivery_messages
                as List<Query$GetCustomerDeliveryMessages$delivery_messages>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_messages(
          Iterable<Query$GetCustomerDeliveryMessages$delivery_messages> Function(
                  Iterable<
                      CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages<
                          Query$GetCustomerDeliveryMessages$delivery_messages>>)
              _fn) =>
      call(
          delivery_messages: _fn(_instance.delivery_messages.map((e) =>
              CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetCustomerDeliveryMessages<TRes>
    implements CopyWith$Query$GetCustomerDeliveryMessages<TRes> {
  _CopyWithStubImpl$Query$GetCustomerDeliveryMessages(this._res);

  TRes _res;

  call({
    List<Query$GetCustomerDeliveryMessages$delivery_messages>?
        delivery_messages,
    String? $__typename,
  }) =>
      _res;
  delivery_messages(_fn) => _res;
}

const documentNodeQueryGetCustomerDeliveryMessages = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetCustomerDeliveryMessages'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'phone_number')),
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
        name: NameNode(value: 'delivery_messages'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'phone_number'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'phone_number')),
                  )
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'received_time'),
                value: EnumValueNode(name: NameNode(value: 'asc')),
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
            name: NameNode(value: 'entry'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone_number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'driver_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'received_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'finished_time'),
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
            name: NameNode(value: 'responded_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'driver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user'),
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
                    name: NameNode(value: 'phone'),
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
            name: NameNode(value: 'customer'),
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
      
    ]),
  ),
]);
Query$GetCustomerDeliveryMessages _parserFn$Query$GetCustomerDeliveryMessages(
        Map<String, dynamic> data) =>
    Query$GetCustomerDeliveryMessages.fromJson(data);

class Options$Query$GetCustomerDeliveryMessages
    extends graphql.QueryOptions<Query$GetCustomerDeliveryMessages> {
  Options$Query$GetCustomerDeliveryMessages({
    String? operationName,
    required Variables$Query$GetCustomerDeliveryMessages variables,
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
          document: documentNodeQueryGetCustomerDeliveryMessages,
          parserFn: _parserFn$Query$GetCustomerDeliveryMessages,
        );
}

class WatchOptions$Query$GetCustomerDeliveryMessages
    extends graphql.WatchQueryOptions<Query$GetCustomerDeliveryMessages> {
  WatchOptions$Query$GetCustomerDeliveryMessages({
    String? operationName,
    required Variables$Query$GetCustomerDeliveryMessages variables,
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
          document: documentNodeQueryGetCustomerDeliveryMessages,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetCustomerDeliveryMessages,
        );
}

class FetchMoreOptions$Query$GetCustomerDeliveryMessages
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetCustomerDeliveryMessages({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetCustomerDeliveryMessages variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetCustomerDeliveryMessages,
        );
}

extension ClientExtension$Query$GetCustomerDeliveryMessages
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetCustomerDeliveryMessages>>
      query$GetCustomerDeliveryMessages(
              Options$Query$GetCustomerDeliveryMessages options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetCustomerDeliveryMessages>
      watchQuery$GetCustomerDeliveryMessages(
              WatchOptions$Query$GetCustomerDeliveryMessages options) =>
          this.watchQuery(options);
  void writeQuery$GetCustomerDeliveryMessages({
    required Query$GetCustomerDeliveryMessages data,
    required Variables$Query$GetCustomerDeliveryMessages variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetCustomerDeliveryMessages),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetCustomerDeliveryMessages? readQuery$GetCustomerDeliveryMessages({
    required Variables$Query$GetCustomerDeliveryMessages variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryGetCustomerDeliveryMessages),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetCustomerDeliveryMessages.fromJson(result);
  }
}

class Query$GetCustomerDeliveryMessages$delivery_messages {
  Query$GetCustomerDeliveryMessages$delivery_messages({
    required this.id,
    required this.entry,
    required this.phone_number,
    this.driver_id,
    required this.received_time,
    this.finished_time,
    this.user_id,
    this.responded_time,
    this.driver,
    this.customer,
    required this.$__typename,
  });

  factory Query$GetCustomerDeliveryMessages$delivery_messages.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$entry = json['entry'];
    final l$phone_number = json['phone_number'];
    final l$driver_id = json['driver_id'];
    final l$received_time = json['received_time'];
    final l$finished_time = json['finished_time'];
    final l$user_id = json['user_id'];
    final l$responded_time = json['responded_time'];
    final l$driver = json['driver'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$GetCustomerDeliveryMessages$delivery_messages(
      id: (l$id as int),
      entry: mapFromJson(l$entry),
      phone_number: (l$phone_number as String),
      driver_id: (l$driver_id as int?),
      received_time: (l$received_time as String),
      finished_time: (l$finished_time as String?),
      user_id: (l$user_id as int?),
      responded_time: (l$responded_time as String?),
      driver: l$driver == null
          ? null
          : Query$GetCustomerDeliveryMessages$delivery_messages$driver.fromJson(
              (l$driver as Map<String, dynamic>)),
      customer: l$customer == null
          ? null
          : Query$GetCustomerDeliveryMessages$delivery_messages$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic entry;

  final String phone_number;

  final int? driver_id;

  final String received_time;

  final String? finished_time;

  final int? user_id;

  final String? responded_time;

  final Query$GetCustomerDeliveryMessages$delivery_messages$driver? driver;

  final Query$GetCustomerDeliveryMessages$delivery_messages$customer? customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$entry = entry;
    _resultData['entry'] = mapToJson(l$entry);
    final l$phone_number = phone_number;
    _resultData['phone_number'] = l$phone_number;
    final l$driver_id = driver_id;
    _resultData['driver_id'] = l$driver_id;
    final l$received_time = received_time;
    _resultData['received_time'] = l$received_time;
    final l$finished_time = finished_time;
    _resultData['finished_time'] = l$finished_time;
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$responded_time = responded_time;
    _resultData['responded_time'] = l$responded_time;
    final l$driver = driver;
    _resultData['driver'] = l$driver?.toJson();
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$entry = entry;
    final l$phone_number = phone_number;
    final l$driver_id = driver_id;
    final l$received_time = received_time;
    final l$finished_time = finished_time;
    final l$user_id = user_id;
    final l$responded_time = responded_time;
    final l$driver = driver;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$entry,
      l$phone_number,
      l$driver_id,
      l$received_time,
      l$finished_time,
      l$user_id,
      l$responded_time,
      l$driver,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetCustomerDeliveryMessages$delivery_messages) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$entry = entry;
    final lOther$entry = other.entry;
    if (l$entry != lOther$entry) {
      return false;
    }
    final l$phone_number = phone_number;
    final lOther$phone_number = other.phone_number;
    if (l$phone_number != lOther$phone_number) {
      return false;
    }
    final l$driver_id = driver_id;
    final lOther$driver_id = other.driver_id;
    if (l$driver_id != lOther$driver_id) {
      return false;
    }
    final l$received_time = received_time;
    final lOther$received_time = other.received_time;
    if (l$received_time != lOther$received_time) {
      return false;
    }
    final l$finished_time = finished_time;
    final lOther$finished_time = other.finished_time;
    if (l$finished_time != lOther$finished_time) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$responded_time = responded_time;
    final lOther$responded_time = other.responded_time;
    if (l$responded_time != lOther$responded_time) {
      return false;
    }
    final l$driver = driver;
    final lOther$driver = other.driver;
    if (l$driver != lOther$driver) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
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

extension UtilityExtension$Query$GetCustomerDeliveryMessages$delivery_messages
    on Query$GetCustomerDeliveryMessages$delivery_messages {
  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages<
          Query$GetCustomerDeliveryMessages$delivery_messages>
      get copyWith =>
          CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages<
    TRes> {
  factory CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages(
    Query$GetCustomerDeliveryMessages$delivery_messages instance,
    TRes Function(Query$GetCustomerDeliveryMessages$delivery_messages) then,
  ) = _CopyWithImpl$Query$GetCustomerDeliveryMessages$delivery_messages;

  factory CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetCustomerDeliveryMessages$delivery_messages;

  TRes call({
    int? id,
    dynamic? entry,
    String? phone_number,
    int? driver_id,
    String? received_time,
    String? finished_time,
    int? user_id,
    String? responded_time,
    Query$GetCustomerDeliveryMessages$delivery_messages$driver? driver,
    Query$GetCustomerDeliveryMessages$delivery_messages$customer? customer,
    String? $__typename,
  });
  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver<TRes>
      get driver;
  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer<TRes>
      get customer;
}

class _CopyWithImpl$Query$GetCustomerDeliveryMessages$delivery_messages<TRes>
    implements
        CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages<TRes> {
  _CopyWithImpl$Query$GetCustomerDeliveryMessages$delivery_messages(
    this._instance,
    this._then,
  );

  final Query$GetCustomerDeliveryMessages$delivery_messages _instance;

  final TRes Function(Query$GetCustomerDeliveryMessages$delivery_messages)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? entry = _undefined,
    Object? phone_number = _undefined,
    Object? driver_id = _undefined,
    Object? received_time = _undefined,
    Object? finished_time = _undefined,
    Object? user_id = _undefined,
    Object? responded_time = _undefined,
    Object? driver = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCustomerDeliveryMessages$delivery_messages(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        entry: entry == _undefined || entry == null
            ? _instance.entry
            : (entry as dynamic),
        phone_number: phone_number == _undefined || phone_number == null
            ? _instance.phone_number
            : (phone_number as String),
        driver_id:
            driver_id == _undefined ? _instance.driver_id : (driver_id as int?),
        received_time: received_time == _undefined || received_time == null
            ? _instance.received_time
            : (received_time as String),
        finished_time: finished_time == _undefined
            ? _instance.finished_time
            : (finished_time as String?),
        user_id: user_id == _undefined ? _instance.user_id : (user_id as int?),
        responded_time: responded_time == _undefined
            ? _instance.responded_time
            : (responded_time as String?),
        driver: driver == _undefined
            ? _instance.driver
            : (driver
                as Query$GetCustomerDeliveryMessages$delivery_messages$driver?),
        customer: customer == _undefined
            ? _instance.customer
            : (customer
                as Query$GetCustomerDeliveryMessages$delivery_messages$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver<TRes>
      get driver {
    final local$driver = _instance.driver;
    return local$driver == null
        ? CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver
            .stub(_then(_instance))
        : CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver(
            local$driver, (e) => call(driver: e));
  }

  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer
            .stub(_then(_instance))
        : CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer(
            local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$GetCustomerDeliveryMessages$delivery_messages<
        TRes>
    implements
        CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages<TRes> {
  _CopyWithStubImpl$Query$GetCustomerDeliveryMessages$delivery_messages(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? entry,
    String? phone_number,
    int? driver_id,
    String? received_time,
    String? finished_time,
    int? user_id,
    String? responded_time,
    Query$GetCustomerDeliveryMessages$delivery_messages$driver? driver,
    Query$GetCustomerDeliveryMessages$delivery_messages$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver<TRes>
      get driver =>
          CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver
              .stub(_res);
  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer<TRes>
      get customer =>
          CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer
              .stub(_res);
}

class Query$GetCustomerDeliveryMessages$delivery_messages$driver {
  Query$GetCustomerDeliveryMessages$delivery_messages$driver({
    required this.user,
    required this.$__typename,
  });

  factory Query$GetCustomerDeliveryMessages$delivery_messages$driver.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetCustomerDeliveryMessages$delivery_messages$driver(
      user: Query$GetCustomerDeliveryMessages$delivery_messages$driver$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$GetCustomerDeliveryMessages$delivery_messages$driver$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetCustomerDeliveryMessages$delivery_messages$driver) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetCustomerDeliveryMessages$delivery_messages$driver
    on Query$GetCustomerDeliveryMessages$delivery_messages$driver {
  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver<
          Query$GetCustomerDeliveryMessages$delivery_messages$driver>
      get copyWith =>
          CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver<
    TRes> {
  factory CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver(
    Query$GetCustomerDeliveryMessages$delivery_messages$driver instance,
    TRes Function(Query$GetCustomerDeliveryMessages$delivery_messages$driver)
        then,
  ) = _CopyWithImpl$Query$GetCustomerDeliveryMessages$delivery_messages$driver;

  factory CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetCustomerDeliveryMessages$delivery_messages$driver;

  TRes call({
    Query$GetCustomerDeliveryMessages$delivery_messages$driver$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user<TRes>
      get user;
}

class _CopyWithImpl$Query$GetCustomerDeliveryMessages$delivery_messages$driver<
        TRes>
    implements
        CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver<
            TRes> {
  _CopyWithImpl$Query$GetCustomerDeliveryMessages$delivery_messages$driver(
    this._instance,
    this._then,
  );

  final Query$GetCustomerDeliveryMessages$delivery_messages$driver _instance;

  final TRes Function(
      Query$GetCustomerDeliveryMessages$delivery_messages$driver) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCustomerDeliveryMessages$delivery_messages$driver(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$GetCustomerDeliveryMessages$delivery_messages$driver$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetCustomerDeliveryMessages$delivery_messages$driver<
        TRes>
    implements
        CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver<
            TRes> {
  _CopyWithStubImpl$Query$GetCustomerDeliveryMessages$delivery_messages$driver(
      this._res);

  TRes _res;

  call({
    Query$GetCustomerDeliveryMessages$delivery_messages$driver$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user<TRes>
      get user =>
          CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user
              .stub(_res);
}

class Query$GetCustomerDeliveryMessages$delivery_messages$driver$user {
  Query$GetCustomerDeliveryMessages$delivery_messages$driver$user({
    this.name,
    this.phone,
    required this.$__typename,
  });

  factory Query$GetCustomerDeliveryMessages$delivery_messages$driver$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$phone = json['phone'];
    final l$$__typename = json['__typename'];
    return Query$GetCustomerDeliveryMessages$delivery_messages$driver$user(
      name: (l$name as String?),
      phone: (l$phone as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String? phone;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$phone = phone;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$phone,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetCustomerDeliveryMessages$delivery_messages$driver$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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

extension UtilityExtension$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user
    on Query$GetCustomerDeliveryMessages$delivery_messages$driver$user {
  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user<
          Query$GetCustomerDeliveryMessages$delivery_messages$driver$user>
      get copyWith =>
          CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user<
    TRes> {
  factory CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user(
    Query$GetCustomerDeliveryMessages$delivery_messages$driver$user instance,
    TRes Function(
            Query$GetCustomerDeliveryMessages$delivery_messages$driver$user)
        then,
  ) = _CopyWithImpl$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user;

  factory CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user;

  TRes call({
    String? name,
    String? phone,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user<
        TRes>
    implements
        CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user<
            TRes> {
  _CopyWithImpl$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user(
    this._instance,
    this._then,
  );

  final Query$GetCustomerDeliveryMessages$delivery_messages$driver$user
      _instance;

  final TRes Function(
      Query$GetCustomerDeliveryMessages$delivery_messages$driver$user) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? phone = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCustomerDeliveryMessages$delivery_messages$driver$user(
        name: name == _undefined ? _instance.name : (name as String?),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user<
        TRes>
    implements
        CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user<
            TRes> {
  _CopyWithStubImpl$Query$GetCustomerDeliveryMessages$delivery_messages$driver$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? phone,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetCustomerDeliveryMessages$delivery_messages$customer {
  Query$GetCustomerDeliveryMessages$delivery_messages$customer({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$GetCustomerDeliveryMessages$delivery_messages$customer.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$GetCustomerDeliveryMessages$delivery_messages$customer(
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String? image;

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
            is Query$GetCustomerDeliveryMessages$delivery_messages$customer) ||
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

extension UtilityExtension$Query$GetCustomerDeliveryMessages$delivery_messages$customer
    on Query$GetCustomerDeliveryMessages$delivery_messages$customer {
  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer<
          Query$GetCustomerDeliveryMessages$delivery_messages$customer>
      get copyWith =>
          CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer<
    TRes> {
  factory CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer(
    Query$GetCustomerDeliveryMessages$delivery_messages$customer instance,
    TRes Function(Query$GetCustomerDeliveryMessages$delivery_messages$customer)
        then,
  ) = _CopyWithImpl$Query$GetCustomerDeliveryMessages$delivery_messages$customer;

  factory CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetCustomerDeliveryMessages$delivery_messages$customer;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetCustomerDeliveryMessages$delivery_messages$customer<
        TRes>
    implements
        CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer<
            TRes> {
  _CopyWithImpl$Query$GetCustomerDeliveryMessages$delivery_messages$customer(
    this._instance,
    this._then,
  );

  final Query$GetCustomerDeliveryMessages$delivery_messages$customer _instance;

  final TRes Function(
      Query$GetCustomerDeliveryMessages$delivery_messages$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCustomerDeliveryMessages$delivery_messages$customer(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetCustomerDeliveryMessages$delivery_messages$customer<
        TRes>
    implements
        CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer<
            TRes> {
  _CopyWithStubImpl$Query$GetCustomerDeliveryMessages$delivery_messages$customer(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}
