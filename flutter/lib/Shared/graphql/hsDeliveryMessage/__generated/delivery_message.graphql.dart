import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Query$GetDeliveryMessages {
  Query$GetDeliveryMessages({
    required this.delivery_messages,
    required this.$__typename,
  });

  factory Query$GetDeliveryMessages.fromJson(Map<String, dynamic> json) {
    final l$delivery_messages = json['delivery_messages'];
    final l$$__typename = json['__typename'];
    return Query$GetDeliveryMessages(
      delivery_messages: (l$delivery_messages as List<dynamic>)
          .map((e) => Query$GetDeliveryMessages$delivery_messages.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$GetDeliveryMessages$delivery_messages> delivery_messages;

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
    if (!(other is Query$GetDeliveryMessages) ||
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

extension UtilityExtension$Query$GetDeliveryMessages
    on Query$GetDeliveryMessages {
  CopyWith$Query$GetDeliveryMessages<Query$GetDeliveryMessages> get copyWith =>
      CopyWith$Query$GetDeliveryMessages(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetDeliveryMessages<TRes> {
  factory CopyWith$Query$GetDeliveryMessages(
    Query$GetDeliveryMessages instance,
    TRes Function(Query$GetDeliveryMessages) then,
  ) = _CopyWithImpl$Query$GetDeliveryMessages;

  factory CopyWith$Query$GetDeliveryMessages.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDeliveryMessages;

  TRes call({
    List<Query$GetDeliveryMessages$delivery_messages>? delivery_messages,
    String? $__typename,
  });
  TRes delivery_messages(
      Iterable<Query$GetDeliveryMessages$delivery_messages> Function(
              Iterable<
                  CopyWith$Query$GetDeliveryMessages$delivery_messages<
                      Query$GetDeliveryMessages$delivery_messages>>)
          _fn);
}

class _CopyWithImpl$Query$GetDeliveryMessages<TRes>
    implements CopyWith$Query$GetDeliveryMessages<TRes> {
  _CopyWithImpl$Query$GetDeliveryMessages(
    this._instance,
    this._then,
  );

  final Query$GetDeliveryMessages _instance;

  final TRes Function(Query$GetDeliveryMessages) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_messages = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetDeliveryMessages(
        delivery_messages:
            delivery_messages == _undefined || delivery_messages == null
                ? _instance.delivery_messages
                : (delivery_messages
                    as List<Query$GetDeliveryMessages$delivery_messages>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_messages(
          Iterable<Query$GetDeliveryMessages$delivery_messages> Function(
                  Iterable<
                      CopyWith$Query$GetDeliveryMessages$delivery_messages<
                          Query$GetDeliveryMessages$delivery_messages>>)
              _fn) =>
      call(
          delivery_messages: _fn(_instance.delivery_messages
              .map((e) => CopyWith$Query$GetDeliveryMessages$delivery_messages(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetDeliveryMessages<TRes>
    implements CopyWith$Query$GetDeliveryMessages<TRes> {
  _CopyWithStubImpl$Query$GetDeliveryMessages(this._res);

  TRes _res;

  call({
    List<Query$GetDeliveryMessages$delivery_messages>? delivery_messages,
    String? $__typename,
  }) =>
      _res;
  delivery_messages(_fn) => _res;
}

const documentNodeQueryGetDeliveryMessages = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetDeliveryMessages'),
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
                name: NameNode(value: 'responded_time'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_is_null'),
                    value: BooleanValueNode(value: true),
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
Query$GetDeliveryMessages _parserFn$Query$GetDeliveryMessages(
        Map<String, dynamic> data) =>
    Query$GetDeliveryMessages.fromJson(data);

class Options$Query$GetDeliveryMessages
    extends graphql.QueryOptions<Query$GetDeliveryMessages> {
  Options$Query$GetDeliveryMessages({
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
          document: documentNodeQueryGetDeliveryMessages,
          parserFn: _parserFn$Query$GetDeliveryMessages,
        );
}

class WatchOptions$Query$GetDeliveryMessages
    extends graphql.WatchQueryOptions<Query$GetDeliveryMessages> {
  WatchOptions$Query$GetDeliveryMessages({
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
          document: documentNodeQueryGetDeliveryMessages,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetDeliveryMessages,
        );
}

class FetchMoreOptions$Query$GetDeliveryMessages
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetDeliveryMessages(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetDeliveryMessages,
        );
}

extension ClientExtension$Query$GetDeliveryMessages on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetDeliveryMessages>>
      query$GetDeliveryMessages(
              [Options$Query$GetDeliveryMessages? options]) async =>
          await this.query(options ?? Options$Query$GetDeliveryMessages());
  graphql.ObservableQuery<Query$GetDeliveryMessages>
      watchQuery$GetDeliveryMessages(
              [WatchOptions$Query$GetDeliveryMessages? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$GetDeliveryMessages());
  void writeQuery$GetDeliveryMessages({
    required Query$GetDeliveryMessages data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryGetDeliveryMessages)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetDeliveryMessages? readQuery$GetDeliveryMessages(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetDeliveryMessages)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetDeliveryMessages.fromJson(result);
  }
}

class Query$GetDeliveryMessages$delivery_messages {
  Query$GetDeliveryMessages$delivery_messages({
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

  factory Query$GetDeliveryMessages$delivery_messages.fromJson(
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
    return Query$GetDeliveryMessages$delivery_messages(
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
          : Query$GetDeliveryMessages$delivery_messages$customer.fromJson(
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

  final Query$GetDeliveryMessages$delivery_messages$customer? customer;

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
    if (!(other is Query$GetDeliveryMessages$delivery_messages) ||
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

extension UtilityExtension$Query$GetDeliveryMessages$delivery_messages
    on Query$GetDeliveryMessages$delivery_messages {
  CopyWith$Query$GetDeliveryMessages$delivery_messages<
          Query$GetDeliveryMessages$delivery_messages>
      get copyWith => CopyWith$Query$GetDeliveryMessages$delivery_messages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetDeliveryMessages$delivery_messages<TRes> {
  factory CopyWith$Query$GetDeliveryMessages$delivery_messages(
    Query$GetDeliveryMessages$delivery_messages instance,
    TRes Function(Query$GetDeliveryMessages$delivery_messages) then,
  ) = _CopyWithImpl$Query$GetDeliveryMessages$delivery_messages;

  factory CopyWith$Query$GetDeliveryMessages$delivery_messages.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDeliveryMessages$delivery_messages;

  TRes call({
    int? id,
    dynamic? entry,
    String? phone_number,
    int? driver_id,
    String? received_time,
    String? finished_time,
    int? user_id,
    String? responded_time,
    Query$GetDeliveryMessages$delivery_messages$customer? customer,
    String? $__typename,
  });
  CopyWith$Query$GetDeliveryMessages$delivery_messages$customer<TRes>
      get customer;
}

class _CopyWithImpl$Query$GetDeliveryMessages$delivery_messages<TRes>
    implements CopyWith$Query$GetDeliveryMessages$delivery_messages<TRes> {
  _CopyWithImpl$Query$GetDeliveryMessages$delivery_messages(
    this._instance,
    this._then,
  );

  final Query$GetDeliveryMessages$delivery_messages _instance;

  final TRes Function(Query$GetDeliveryMessages$delivery_messages) _then;

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
      _then(Query$GetDeliveryMessages$delivery_messages(
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
                as Query$GetDeliveryMessages$delivery_messages$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetDeliveryMessages$delivery_messages$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Query$GetDeliveryMessages$delivery_messages$customer.stub(
            _then(_instance))
        : CopyWith$Query$GetDeliveryMessages$delivery_messages$customer(
            local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$GetDeliveryMessages$delivery_messages<TRes>
    implements CopyWith$Query$GetDeliveryMessages$delivery_messages<TRes> {
  _CopyWithStubImpl$Query$GetDeliveryMessages$delivery_messages(this._res);

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
    Query$GetDeliveryMessages$delivery_messages$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetDeliveryMessages$delivery_messages$customer<TRes>
      get customer =>
          CopyWith$Query$GetDeliveryMessages$delivery_messages$customer.stub(
              _res);
}

class Query$GetDeliveryMessages$delivery_messages$customer {
  Query$GetDeliveryMessages$delivery_messages$customer({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$GetDeliveryMessages$delivery_messages$customer.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$GetDeliveryMessages$delivery_messages$customer(
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
    if (!(other is Query$GetDeliveryMessages$delivery_messages$customer) ||
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

extension UtilityExtension$Query$GetDeliveryMessages$delivery_messages$customer
    on Query$GetDeliveryMessages$delivery_messages$customer {
  CopyWith$Query$GetDeliveryMessages$delivery_messages$customer<
          Query$GetDeliveryMessages$delivery_messages$customer>
      get copyWith =>
          CopyWith$Query$GetDeliveryMessages$delivery_messages$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetDeliveryMessages$delivery_messages$customer<
    TRes> {
  factory CopyWith$Query$GetDeliveryMessages$delivery_messages$customer(
    Query$GetDeliveryMessages$delivery_messages$customer instance,
    TRes Function(Query$GetDeliveryMessages$delivery_messages$customer) then,
  ) = _CopyWithImpl$Query$GetDeliveryMessages$delivery_messages$customer;

  factory CopyWith$Query$GetDeliveryMessages$delivery_messages$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetDeliveryMessages$delivery_messages$customer;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetDeliveryMessages$delivery_messages$customer<TRes>
    implements
        CopyWith$Query$GetDeliveryMessages$delivery_messages$customer<TRes> {
  _CopyWithImpl$Query$GetDeliveryMessages$delivery_messages$customer(
    this._instance,
    this._then,
  );

  final Query$GetDeliveryMessages$delivery_messages$customer _instance;

  final TRes Function(Query$GetDeliveryMessages$delivery_messages$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetDeliveryMessages$delivery_messages$customer(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetDeliveryMessages$delivery_messages$customer<
        TRes>
    implements
        CopyWith$Query$GetDeliveryMessages$delivery_messages$customer<TRes> {
  _CopyWithStubImpl$Query$GetDeliveryMessages$delivery_messages$customer(
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
    Query$GetCustomerDeliveryMessages$delivery_messages$customer? customer,
    String? $__typename,
  });
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
        customer: customer == _undefined
            ? _instance.customer
            : (customer
                as Query$GetCustomerDeliveryMessages$delivery_messages$customer?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
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
    Query$GetCustomerDeliveryMessages$delivery_messages$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer<TRes>
      get customer =>
          CopyWith$Query$GetCustomerDeliveryMessages$delivery_messages$customer
              .stub(_res);
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
