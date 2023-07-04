import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$getCustomerCards {
  factory Variables$Query$getCustomerCards({required int custId}) =>
      Variables$Query$getCustomerCards._({
        r'custId': custId,
      });

  Variables$Query$getCustomerCards._(this._$data);

  factory Variables$Query$getCustomerCards.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$custId = data['custId'];
    result$data['custId'] = (l$custId as int);
    return Variables$Query$getCustomerCards._(result$data);
  }

  Map<String, dynamic> _$data;

  int get custId => (_$data['custId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$custId = custId;
    result$data['custId'] = l$custId;
    return result$data;
  }

  CopyWith$Variables$Query$getCustomerCards<Variables$Query$getCustomerCards>
      get copyWith => CopyWith$Variables$Query$getCustomerCards(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getCustomerCards) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$custId = custId;
    final lOther$custId = other.custId;
    if (l$custId != lOther$custId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$custId = custId;
    return Object.hashAll([l$custId]);
  }
}

abstract class CopyWith$Variables$Query$getCustomerCards<TRes> {
  factory CopyWith$Variables$Query$getCustomerCards(
    Variables$Query$getCustomerCards instance,
    TRes Function(Variables$Query$getCustomerCards) then,
  ) = _CopyWithImpl$Variables$Query$getCustomerCards;

  factory CopyWith$Variables$Query$getCustomerCards.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getCustomerCards;

  TRes call({int? custId});
}

class _CopyWithImpl$Variables$Query$getCustomerCards<TRes>
    implements CopyWith$Variables$Query$getCustomerCards<TRes> {
  _CopyWithImpl$Variables$Query$getCustomerCards(
    this._instance,
    this._then,
  );

  final Variables$Query$getCustomerCards _instance;

  final TRes Function(Variables$Query$getCustomerCards) _then;

  static const _undefined = {};

  TRes call({Object? custId = _undefined}) =>
      _then(Variables$Query$getCustomerCards._({
        ..._instance._$data,
        if (custId != _undefined && custId != null) 'custId': (custId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getCustomerCards<TRes>
    implements CopyWith$Variables$Query$getCustomerCards<TRes> {
  _CopyWithStubImpl$Variables$Query$getCustomerCards(this._res);

  TRes _res;

  call({int? custId}) => _res;
}

class Query$getCustomerCards {
  Query$getCustomerCards({
    required this.customer_stripe_cards,
    required this.$__typename,
  });

  factory Query$getCustomerCards.fromJson(Map<String, dynamic> json) {
    final l$customer_stripe_cards = json['customer_stripe_cards'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCards(
      customer_stripe_cards: (l$customer_stripe_cards as List<dynamic>)
          .map((e) => Query$getCustomerCards$customer_stripe_cards.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getCustomerCards$customer_stripe_cards>
      customer_stripe_cards;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_stripe_cards = customer_stripe_cards;
    _resultData['customer_stripe_cards'] =
        l$customer_stripe_cards.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_stripe_cards = customer_stripe_cards;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$customer_stripe_cards.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerCards) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_stripe_cards = customer_stripe_cards;
    final lOther$customer_stripe_cards = other.customer_stripe_cards;
    if (l$customer_stripe_cards.length != lOther$customer_stripe_cards.length) {
      return false;
    }
    for (int i = 0; i < l$customer_stripe_cards.length; i++) {
      final l$customer_stripe_cards$entry = l$customer_stripe_cards[i];
      final lOther$customer_stripe_cards$entry =
          lOther$customer_stripe_cards[i];
      if (l$customer_stripe_cards$entry != lOther$customer_stripe_cards$entry) {
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

extension UtilityExtension$Query$getCustomerCards on Query$getCustomerCards {
  CopyWith$Query$getCustomerCards<Query$getCustomerCards> get copyWith =>
      CopyWith$Query$getCustomerCards(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getCustomerCards<TRes> {
  factory CopyWith$Query$getCustomerCards(
    Query$getCustomerCards instance,
    TRes Function(Query$getCustomerCards) then,
  ) = _CopyWithImpl$Query$getCustomerCards;

  factory CopyWith$Query$getCustomerCards.stub(TRes res) =
      _CopyWithStubImpl$Query$getCustomerCards;

  TRes call({
    List<Query$getCustomerCards$customer_stripe_cards>? customer_stripe_cards,
    String? $__typename,
  });
  TRes customer_stripe_cards(
      Iterable<Query$getCustomerCards$customer_stripe_cards> Function(
              Iterable<
                  CopyWith$Query$getCustomerCards$customer_stripe_cards<
                      Query$getCustomerCards$customer_stripe_cards>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerCards<TRes>
    implements CopyWith$Query$getCustomerCards<TRes> {
  _CopyWithImpl$Query$getCustomerCards(
    this._instance,
    this._then,
  );

  final Query$getCustomerCards _instance;

  final TRes Function(Query$getCustomerCards) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_stripe_cards = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCards(
        customer_stripe_cards:
            customer_stripe_cards == _undefined || customer_stripe_cards == null
                ? _instance.customer_stripe_cards
                : (customer_stripe_cards
                    as List<Query$getCustomerCards$customer_stripe_cards>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes customer_stripe_cards(
          Iterable<Query$getCustomerCards$customer_stripe_cards> Function(
                  Iterable<
                      CopyWith$Query$getCustomerCards$customer_stripe_cards<
                          Query$getCustomerCards$customer_stripe_cards>>)
              _fn) =>
      call(
          customer_stripe_cards: _fn(_instance.customer_stripe_cards
              .map((e) => CopyWith$Query$getCustomerCards$customer_stripe_cards(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerCards<TRes>
    implements CopyWith$Query$getCustomerCards<TRes> {
  _CopyWithStubImpl$Query$getCustomerCards(this._res);

  TRes _res;

  call({
    List<Query$getCustomerCards$customer_stripe_cards>? customer_stripe_cards,
    String? $__typename,
  }) =>
      _res;
  customer_stripe_cards(_fn) => _res;
}

const documentNodeQuerygetCustomerCards = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getCustomerCards'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'custId')),
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
        name: NameNode(value: 'customer_stripe_cards'),
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
                    value: VariableNode(name: NameNode(value: 'custId')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'brand'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'card_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'exp_month'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'exp_year'),
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
            name: NameNode(value: 'last_4'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sp_card_ids'),
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
Query$getCustomerCards _parserFn$Query$getCustomerCards(
        Map<String, dynamic> data) =>
    Query$getCustomerCards.fromJson(data);

class Options$Query$getCustomerCards
    extends graphql.QueryOptions<Query$getCustomerCards> {
  Options$Query$getCustomerCards({
    String? operationName,
    required Variables$Query$getCustomerCards variables,
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
          document: documentNodeQuerygetCustomerCards,
          parserFn: _parserFn$Query$getCustomerCards,
        );
}

class WatchOptions$Query$getCustomerCards
    extends graphql.WatchQueryOptions<Query$getCustomerCards> {
  WatchOptions$Query$getCustomerCards({
    String? operationName,
    required Variables$Query$getCustomerCards variables,
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
          document: documentNodeQuerygetCustomerCards,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getCustomerCards,
        );
}

class FetchMoreOptions$Query$getCustomerCards extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getCustomerCards({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getCustomerCards variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetCustomerCards,
        );
}

extension ClientExtension$Query$getCustomerCards on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getCustomerCards>> query$getCustomerCards(
          Options$Query$getCustomerCards options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getCustomerCards> watchQuery$getCustomerCards(
          WatchOptions$Query$getCustomerCards options) =>
      this.watchQuery(options);
  void writeQuery$getCustomerCards({
    required Query$getCustomerCards data,
    required Variables$Query$getCustomerCards variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetCustomerCards),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getCustomerCards? readQuery$getCustomerCards({
    required Variables$Query$getCustomerCards variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetCustomerCards),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getCustomerCards.fromJson(result);
  }
}

class Query$getCustomerCards$customer_stripe_cards {
  Query$getCustomerCards$customer_stripe_cards({
    this.brand,
    required this.card_id,
    required this.customer_id,
    this.exp_month,
    this.exp_year,
    required this.id,
    this.last_4,
    this.sp_card_ids,
    required this.$__typename,
  });

  factory Query$getCustomerCards$customer_stripe_cards.fromJson(
      Map<String, dynamic> json) {
    final l$brand = json['brand'];
    final l$card_id = json['card_id'];
    final l$customer_id = json['customer_id'];
    final l$exp_month = json['exp_month'];
    final l$exp_year = json['exp_year'];
    final l$id = json['id'];
    final l$last_4 = json['last_4'];
    final l$sp_card_ids = json['sp_card_ids'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerCards$customer_stripe_cards(
      brand: (l$brand as String?),
      card_id: (l$card_id as String),
      customer_id: (l$customer_id as int),
      exp_month: (l$exp_month as int?),
      exp_year: (l$exp_year as int?),
      id: (l$id as int),
      last_4: (l$last_4 as String?),
      sp_card_ids: l$sp_card_ids == null ? null : mapFromJson(l$sp_card_ids),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? brand;

  final String card_id;

  final int customer_id;

  final int? exp_month;

  final int? exp_year;

  final int id;

  final String? last_4;

  final dynamic? sp_card_ids;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$brand = brand;
    _resultData['brand'] = l$brand;
    final l$card_id = card_id;
    _resultData['card_id'] = l$card_id;
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$exp_month = exp_month;
    _resultData['exp_month'] = l$exp_month;
    final l$exp_year = exp_year;
    _resultData['exp_year'] = l$exp_year;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$last_4 = last_4;
    _resultData['last_4'] = l$last_4;
    final l$sp_card_ids = sp_card_ids;
    _resultData['sp_card_ids'] =
        l$sp_card_ids == null ? null : mapToJson(l$sp_card_ids);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$brand = brand;
    final l$card_id = card_id;
    final l$customer_id = customer_id;
    final l$exp_month = exp_month;
    final l$exp_year = exp_year;
    final l$id = id;
    final l$last_4 = last_4;
    final l$sp_card_ids = sp_card_ids;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$brand,
      l$card_id,
      l$customer_id,
      l$exp_month,
      l$exp_year,
      l$id,
      l$last_4,
      l$sp_card_ids,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerCards$customer_stripe_cards) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$brand = brand;
    final lOther$brand = other.brand;
    if (l$brand != lOther$brand) {
      return false;
    }
    final l$card_id = card_id;
    final lOther$card_id = other.card_id;
    if (l$card_id != lOther$card_id) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$exp_month = exp_month;
    final lOther$exp_month = other.exp_month;
    if (l$exp_month != lOther$exp_month) {
      return false;
    }
    final l$exp_year = exp_year;
    final lOther$exp_year = other.exp_year;
    if (l$exp_year != lOther$exp_year) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$last_4 = last_4;
    final lOther$last_4 = other.last_4;
    if (l$last_4 != lOther$last_4) {
      return false;
    }
    final l$sp_card_ids = sp_card_ids;
    final lOther$sp_card_ids = other.sp_card_ids;
    if (l$sp_card_ids != lOther$sp_card_ids) {
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

extension UtilityExtension$Query$getCustomerCards$customer_stripe_cards
    on Query$getCustomerCards$customer_stripe_cards {
  CopyWith$Query$getCustomerCards$customer_stripe_cards<
          Query$getCustomerCards$customer_stripe_cards>
      get copyWith => CopyWith$Query$getCustomerCards$customer_stripe_cards(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerCards$customer_stripe_cards<TRes> {
  factory CopyWith$Query$getCustomerCards$customer_stripe_cards(
    Query$getCustomerCards$customer_stripe_cards instance,
    TRes Function(Query$getCustomerCards$customer_stripe_cards) then,
  ) = _CopyWithImpl$Query$getCustomerCards$customer_stripe_cards;

  factory CopyWith$Query$getCustomerCards$customer_stripe_cards.stub(TRes res) =
      _CopyWithStubImpl$Query$getCustomerCards$customer_stripe_cards;

  TRes call({
    String? brand,
    String? card_id,
    int? customer_id,
    int? exp_month,
    int? exp_year,
    int? id,
    String? last_4,
    dynamic? sp_card_ids,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerCards$customer_stripe_cards<TRes>
    implements CopyWith$Query$getCustomerCards$customer_stripe_cards<TRes> {
  _CopyWithImpl$Query$getCustomerCards$customer_stripe_cards(
    this._instance,
    this._then,
  );

  final Query$getCustomerCards$customer_stripe_cards _instance;

  final TRes Function(Query$getCustomerCards$customer_stripe_cards) _then;

  static const _undefined = {};

  TRes call({
    Object? brand = _undefined,
    Object? card_id = _undefined,
    Object? customer_id = _undefined,
    Object? exp_month = _undefined,
    Object? exp_year = _undefined,
    Object? id = _undefined,
    Object? last_4 = _undefined,
    Object? sp_card_ids = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerCards$customer_stripe_cards(
        brand: brand == _undefined ? _instance.brand : (brand as String?),
        card_id: card_id == _undefined || card_id == null
            ? _instance.card_id
            : (card_id as String),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        exp_month:
            exp_month == _undefined ? _instance.exp_month : (exp_month as int?),
        exp_year:
            exp_year == _undefined ? _instance.exp_year : (exp_year as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        last_4: last_4 == _undefined ? _instance.last_4 : (last_4 as String?),
        sp_card_ids: sp_card_ids == _undefined
            ? _instance.sp_card_ids
            : (sp_card_ids as dynamic?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getCustomerCards$customer_stripe_cards<TRes>
    implements CopyWith$Query$getCustomerCards$customer_stripe_cards<TRes> {
  _CopyWithStubImpl$Query$getCustomerCards$customer_stripe_cards(this._res);

  TRes _res;

  call({
    String? brand,
    String? card_id,
    int? customer_id,
    int? exp_month,
    int? exp_year,
    int? id,
    String? last_4,
    dynamic? sp_card_ids,
    String? $__typename,
  }) =>
      _res;
}
