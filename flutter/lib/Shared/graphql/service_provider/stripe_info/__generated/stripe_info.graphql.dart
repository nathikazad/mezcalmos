import '../../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$addStripePaymentInfo {
  factory Variables$Mutation$addStripePaymentInfo(
          {required Input$service_provider_stripe_info_insert_input data}) =>
      Variables$Mutation$addStripePaymentInfo._({
        r'data': data,
      });

  Variables$Mutation$addStripePaymentInfo._(this._$data);

  factory Variables$Mutation$addStripePaymentInfo.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$data = data['data'];
    result$data['data'] =
        Input$service_provider_stripe_info_insert_input.fromJson(
            (l$data as Map<String, dynamic>));
    return Variables$Mutation$addStripePaymentInfo._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$service_provider_stripe_info_insert_input get data =>
      (_$data['data'] as Input$service_provider_stripe_info_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$data = data;
    result$data['data'] = l$data.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$addStripePaymentInfo<
          Variables$Mutation$addStripePaymentInfo>
      get copyWith => CopyWith$Variables$Mutation$addStripePaymentInfo(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addStripePaymentInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$data = data;
    return Object.hashAll([l$data]);
  }
}

abstract class CopyWith$Variables$Mutation$addStripePaymentInfo<TRes> {
  factory CopyWith$Variables$Mutation$addStripePaymentInfo(
    Variables$Mutation$addStripePaymentInfo instance,
    TRes Function(Variables$Mutation$addStripePaymentInfo) then,
  ) = _CopyWithImpl$Variables$Mutation$addStripePaymentInfo;

  factory CopyWith$Variables$Mutation$addStripePaymentInfo.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addStripePaymentInfo;

  TRes call({Input$service_provider_stripe_info_insert_input? data});
}

class _CopyWithImpl$Variables$Mutation$addStripePaymentInfo<TRes>
    implements CopyWith$Variables$Mutation$addStripePaymentInfo<TRes> {
  _CopyWithImpl$Variables$Mutation$addStripePaymentInfo(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addStripePaymentInfo _instance;

  final TRes Function(Variables$Mutation$addStripePaymentInfo) _then;

  static const _undefined = {};

  TRes call({Object? data = _undefined}) =>
      _then(Variables$Mutation$addStripePaymentInfo._({
        ..._instance._$data,
        if (data != _undefined && data != null)
          'data': (data as Input$service_provider_stripe_info_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addStripePaymentInfo<TRes>
    implements CopyWith$Variables$Mutation$addStripePaymentInfo<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addStripePaymentInfo(this._res);

  TRes _res;

  call({Input$service_provider_stripe_info_insert_input? data}) => _res;
}

class Mutation$addStripePaymentInfo {
  Mutation$addStripePaymentInfo({
    this.insert_service_provider_stripe_info_one,
    required this.$__typename,
  });

  factory Mutation$addStripePaymentInfo.fromJson(Map<String, dynamic> json) {
    final l$insert_service_provider_stripe_info_one =
        json['insert_service_provider_stripe_info_one'];
    final l$$__typename = json['__typename'];
    return Mutation$addStripePaymentInfo(
      insert_service_provider_stripe_info_one:
          l$insert_service_provider_stripe_info_one == null
              ? null
              : Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one
                  .fromJson((l$insert_service_provider_stripe_info_one
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one?
      insert_service_provider_stripe_info_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_service_provider_stripe_info_one =
        insert_service_provider_stripe_info_one;
    _resultData['insert_service_provider_stripe_info_one'] =
        l$insert_service_provider_stripe_info_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_service_provider_stripe_info_one =
        insert_service_provider_stripe_info_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_service_provider_stripe_info_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addStripePaymentInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_service_provider_stripe_info_one =
        insert_service_provider_stripe_info_one;
    final lOther$insert_service_provider_stripe_info_one =
        other.insert_service_provider_stripe_info_one;
    if (l$insert_service_provider_stripe_info_one !=
        lOther$insert_service_provider_stripe_info_one) {
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

extension UtilityExtension$Mutation$addStripePaymentInfo
    on Mutation$addStripePaymentInfo {
  CopyWith$Mutation$addStripePaymentInfo<Mutation$addStripePaymentInfo>
      get copyWith => CopyWith$Mutation$addStripePaymentInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addStripePaymentInfo<TRes> {
  factory CopyWith$Mutation$addStripePaymentInfo(
    Mutation$addStripePaymentInfo instance,
    TRes Function(Mutation$addStripePaymentInfo) then,
  ) = _CopyWithImpl$Mutation$addStripePaymentInfo;

  factory CopyWith$Mutation$addStripePaymentInfo.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addStripePaymentInfo;

  TRes call({
    Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one?
        insert_service_provider_stripe_info_one,
    String? $__typename,
  });
  CopyWith$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one<
      TRes> get insert_service_provider_stripe_info_one;
}

class _CopyWithImpl$Mutation$addStripePaymentInfo<TRes>
    implements CopyWith$Mutation$addStripePaymentInfo<TRes> {
  _CopyWithImpl$Mutation$addStripePaymentInfo(
    this._instance,
    this._then,
  );

  final Mutation$addStripePaymentInfo _instance;

  final TRes Function(Mutation$addStripePaymentInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_service_provider_stripe_info_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addStripePaymentInfo(
        insert_service_provider_stripe_info_one:
            insert_service_provider_stripe_info_one == _undefined
                ? _instance.insert_service_provider_stripe_info_one
                : (insert_service_provider_stripe_info_one
                    as Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one<
      TRes> get insert_service_provider_stripe_info_one {
    final local$insert_service_provider_stripe_info_one =
        _instance.insert_service_provider_stripe_info_one;
    return local$insert_service_provider_stripe_info_one == null
        ? CopyWith$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one
            .stub(_then(_instance))
        : CopyWith$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one(
            local$insert_service_provider_stripe_info_one,
            (e) => call(insert_service_provider_stripe_info_one: e));
  }
}

class _CopyWithStubImpl$Mutation$addStripePaymentInfo<TRes>
    implements CopyWith$Mutation$addStripePaymentInfo<TRes> {
  _CopyWithStubImpl$Mutation$addStripePaymentInfo(this._res);

  TRes _res;

  call({
    Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one?
        insert_service_provider_stripe_info_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one<
          TRes>
      get insert_service_provider_stripe_info_one =>
          CopyWith$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one
              .stub(_res);
}

const documentNodeMutationaddStripePaymentInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addStripePaymentInfo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'data')),
        type: NamedTypeNode(
          name: NameNode(value: 'service_provider_stripe_info_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_service_provider_stripe_info_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'data')),
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
            name: NameNode(value: 'stripe_id'),
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
            name: NameNode(value: 'requirements'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'payouts_enabled'),
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
            name: NameNode(value: 'details_submitted'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'charges_enabled'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'charge_fees_on_customer'),
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
Mutation$addStripePaymentInfo _parserFn$Mutation$addStripePaymentInfo(
        Map<String, dynamic> data) =>
    Mutation$addStripePaymentInfo.fromJson(data);
typedef OnMutationCompleted$Mutation$addStripePaymentInfo = FutureOr<void>
    Function(
  dynamic,
  Mutation$addStripePaymentInfo?,
);

class Options$Mutation$addStripePaymentInfo
    extends graphql.MutationOptions<Mutation$addStripePaymentInfo> {
  Options$Mutation$addStripePaymentInfo({
    String? operationName,
    required Variables$Mutation$addStripePaymentInfo variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addStripePaymentInfo? onCompleted,
    graphql.OnMutationUpdate<Mutation$addStripePaymentInfo>? update,
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
                        : _parserFn$Mutation$addStripePaymentInfo(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddStripePaymentInfo,
          parserFn: _parserFn$Mutation$addStripePaymentInfo,
        );

  final OnMutationCompleted$Mutation$addStripePaymentInfo?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addStripePaymentInfo
    extends graphql.WatchQueryOptions<Mutation$addStripePaymentInfo> {
  WatchOptions$Mutation$addStripePaymentInfo({
    String? operationName,
    required Variables$Mutation$addStripePaymentInfo variables,
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
          document: documentNodeMutationaddStripePaymentInfo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addStripePaymentInfo,
        );
}

extension ClientExtension$Mutation$addStripePaymentInfo
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addStripePaymentInfo>>
      mutate$addStripePaymentInfo(
              Options$Mutation$addStripePaymentInfo options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$addStripePaymentInfo>
      watchMutation$addStripePaymentInfo(
              WatchOptions$Mutation$addStripePaymentInfo options) =>
          this.watchMutation(options);
}

class Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one {
  Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one({
    required this.id,
    required this.stripe_id,
    required this.status,
    this.requirements,
    required this.payouts_enabled,
    this.email,
    required this.details_submitted,
    required this.charges_enabled,
    this.charge_fees_on_customer,
    required this.$__typename,
  });

  factory Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$stripe_id = json['stripe_id'];
    final l$status = json['status'];
    final l$requirements = json['requirements'];
    final l$payouts_enabled = json['payouts_enabled'];
    final l$email = json['email'];
    final l$details_submitted = json['details_submitted'];
    final l$charges_enabled = json['charges_enabled'];
    final l$charge_fees_on_customer = json['charge_fees_on_customer'];
    final l$$__typename = json['__typename'];
    return Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one(
      id: (l$id as int),
      stripe_id: (l$stripe_id as String),
      status: (l$status as String),
      requirements: (l$requirements as String?),
      payouts_enabled: (l$payouts_enabled as bool),
      email: (l$email as String?),
      details_submitted: (l$details_submitted as bool),
      charges_enabled: (l$charges_enabled as bool),
      charge_fees_on_customer: (l$charge_fees_on_customer as bool?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String stripe_id;

  final String status;

  final String? requirements;

  final bool payouts_enabled;

  final String? email;

  final bool details_submitted;

  final bool charges_enabled;

  final bool? charge_fees_on_customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$stripe_id = stripe_id;
    _resultData['stripe_id'] = l$stripe_id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$requirements = requirements;
    _resultData['requirements'] = l$requirements;
    final l$payouts_enabled = payouts_enabled;
    _resultData['payouts_enabled'] = l$payouts_enabled;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$details_submitted = details_submitted;
    _resultData['details_submitted'] = l$details_submitted;
    final l$charges_enabled = charges_enabled;
    _resultData['charges_enabled'] = l$charges_enabled;
    final l$charge_fees_on_customer = charge_fees_on_customer;
    _resultData['charge_fees_on_customer'] = l$charge_fees_on_customer;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$stripe_id = stripe_id;
    final l$status = status;
    final l$requirements = requirements;
    final l$payouts_enabled = payouts_enabled;
    final l$email = email;
    final l$details_submitted = details_submitted;
    final l$charges_enabled = charges_enabled;
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$stripe_id,
      l$status,
      l$requirements,
      l$payouts_enabled,
      l$email,
      l$details_submitted,
      l$charges_enabled,
      l$charge_fees_on_customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$stripe_id = stripe_id;
    final lOther$stripe_id = other.stripe_id;
    if (l$stripe_id != lOther$stripe_id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$requirements = requirements;
    final lOther$requirements = other.requirements;
    if (l$requirements != lOther$requirements) {
      return false;
    }
    final l$payouts_enabled = payouts_enabled;
    final lOther$payouts_enabled = other.payouts_enabled;
    if (l$payouts_enabled != lOther$payouts_enabled) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$details_submitted = details_submitted;
    final lOther$details_submitted = other.details_submitted;
    if (l$details_submitted != lOther$details_submitted) {
      return false;
    }
    final l$charges_enabled = charges_enabled;
    final lOther$charges_enabled = other.charges_enabled;
    if (l$charges_enabled != lOther$charges_enabled) {
      return false;
    }
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final lOther$charge_fees_on_customer = other.charge_fees_on_customer;
    if (l$charge_fees_on_customer != lOther$charge_fees_on_customer) {
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

extension UtilityExtension$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one
    on Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one {
  CopyWith$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one<
          Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one>
      get copyWith =>
          CopyWith$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one<
    TRes> {
  factory CopyWith$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one(
    Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one
        instance,
    TRes Function(
            Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one)
        then,
  ) = _CopyWithImpl$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one;

  factory CopyWith$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one;

  TRes call({
    int? id,
    String? stripe_id,
    String? status,
    String? requirements,
    bool? payouts_enabled,
    String? email,
    bool? details_submitted,
    bool? charges_enabled,
    bool? charge_fees_on_customer,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one<
        TRes>
    implements
        CopyWith$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one<
            TRes> {
  _CopyWithImpl$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one(
    this._instance,
    this._then,
  );

  final Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one
      _instance;

  final TRes Function(
          Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? stripe_id = _undefined,
    Object? status = _undefined,
    Object? requirements = _undefined,
    Object? payouts_enabled = _undefined,
    Object? email = _undefined,
    Object? details_submitted = _undefined,
    Object? charges_enabled = _undefined,
    Object? charge_fees_on_customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        stripe_id: stripe_id == _undefined || stripe_id == null
            ? _instance.stripe_id
            : (stripe_id as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        requirements: requirements == _undefined
            ? _instance.requirements
            : (requirements as String?),
        payouts_enabled:
            payouts_enabled == _undefined || payouts_enabled == null
                ? _instance.payouts_enabled
                : (payouts_enabled as bool),
        email: email == _undefined ? _instance.email : (email as String?),
        details_submitted:
            details_submitted == _undefined || details_submitted == null
                ? _instance.details_submitted
                : (details_submitted as bool),
        charges_enabled:
            charges_enabled == _undefined || charges_enabled == null
                ? _instance.charges_enabled
                : (charges_enabled as bool),
        charge_fees_on_customer: charge_fees_on_customer == _undefined
            ? _instance.charge_fees_on_customer
            : (charge_fees_on_customer as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one<
        TRes>
    implements
        CopyWith$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one<
            TRes> {
  _CopyWithStubImpl$Mutation$addStripePaymentInfo$insert_service_provider_stripe_info_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? stripe_id,
    String? status,
    String? requirements,
    bool? payouts_enabled,
    String? email,
    bool? details_submitted,
    bool? charges_enabled,
    bool? charge_fees_on_customer,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateStripePaymentInfo {
  factory Variables$Mutation$updateStripePaymentInfo({
    required Input$service_provider_stripe_info_set_input data,
    required int sp_id,
  }) =>
      Variables$Mutation$updateStripePaymentInfo._({
        r'data': data,
        r'sp_id': sp_id,
      });

  Variables$Mutation$updateStripePaymentInfo._(this._$data);

  factory Variables$Mutation$updateStripePaymentInfo.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$data = data['data'];
    result$data['data'] = Input$service_provider_stripe_info_set_input.fromJson(
        (l$data as Map<String, dynamic>));
    final l$sp_id = data['sp_id'];
    result$data['sp_id'] = (l$sp_id as int);
    return Variables$Mutation$updateStripePaymentInfo._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$service_provider_stripe_info_set_input get data =>
      (_$data['data'] as Input$service_provider_stripe_info_set_input);
  int get sp_id => (_$data['sp_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$data = data;
    result$data['data'] = l$data.toJson();
    final l$sp_id = sp_id;
    result$data['sp_id'] = l$sp_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$updateStripePaymentInfo<
          Variables$Mutation$updateStripePaymentInfo>
      get copyWith => CopyWith$Variables$Mutation$updateStripePaymentInfo(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateStripePaymentInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    final l$sp_id = sp_id;
    final lOther$sp_id = other.sp_id;
    if (l$sp_id != lOther$sp_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$data = data;
    final l$sp_id = sp_id;
    return Object.hashAll([
      l$data,
      l$sp_id,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateStripePaymentInfo<TRes> {
  factory CopyWith$Variables$Mutation$updateStripePaymentInfo(
    Variables$Mutation$updateStripePaymentInfo instance,
    TRes Function(Variables$Mutation$updateStripePaymentInfo) then,
  ) = _CopyWithImpl$Variables$Mutation$updateStripePaymentInfo;

  factory CopyWith$Variables$Mutation$updateStripePaymentInfo.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateStripePaymentInfo;

  TRes call({
    Input$service_provider_stripe_info_set_input? data,
    int? sp_id,
  });
}

class _CopyWithImpl$Variables$Mutation$updateStripePaymentInfo<TRes>
    implements CopyWith$Variables$Mutation$updateStripePaymentInfo<TRes> {
  _CopyWithImpl$Variables$Mutation$updateStripePaymentInfo(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateStripePaymentInfo _instance;

  final TRes Function(Variables$Mutation$updateStripePaymentInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? data = _undefined,
    Object? sp_id = _undefined,
  }) =>
      _then(Variables$Mutation$updateStripePaymentInfo._({
        ..._instance._$data,
        if (data != _undefined && data != null)
          'data': (data as Input$service_provider_stripe_info_set_input),
        if (sp_id != _undefined && sp_id != null) 'sp_id': (sp_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateStripePaymentInfo<TRes>
    implements CopyWith$Variables$Mutation$updateStripePaymentInfo<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateStripePaymentInfo(this._res);

  TRes _res;

  call({
    Input$service_provider_stripe_info_set_input? data,
    int? sp_id,
  }) =>
      _res;
}

class Mutation$updateStripePaymentInfo {
  Mutation$updateStripePaymentInfo({
    this.update_service_provider_stripe_info_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateStripePaymentInfo.fromJson(Map<String, dynamic> json) {
    final l$update_service_provider_stripe_info_by_pk =
        json['update_service_provider_stripe_info_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateStripePaymentInfo(
      update_service_provider_stripe_info_by_pk:
          l$update_service_provider_stripe_info_by_pk == null
              ? null
              : Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk
                  .fromJson((l$update_service_provider_stripe_info_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk?
      update_service_provider_stripe_info_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_service_provider_stripe_info_by_pk =
        update_service_provider_stripe_info_by_pk;
    _resultData['update_service_provider_stripe_info_by_pk'] =
        l$update_service_provider_stripe_info_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_service_provider_stripe_info_by_pk =
        update_service_provider_stripe_info_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_service_provider_stripe_info_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateStripePaymentInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_service_provider_stripe_info_by_pk =
        update_service_provider_stripe_info_by_pk;
    final lOther$update_service_provider_stripe_info_by_pk =
        other.update_service_provider_stripe_info_by_pk;
    if (l$update_service_provider_stripe_info_by_pk !=
        lOther$update_service_provider_stripe_info_by_pk) {
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

extension UtilityExtension$Mutation$updateStripePaymentInfo
    on Mutation$updateStripePaymentInfo {
  CopyWith$Mutation$updateStripePaymentInfo<Mutation$updateStripePaymentInfo>
      get copyWith => CopyWith$Mutation$updateStripePaymentInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateStripePaymentInfo<TRes> {
  factory CopyWith$Mutation$updateStripePaymentInfo(
    Mutation$updateStripePaymentInfo instance,
    TRes Function(Mutation$updateStripePaymentInfo) then,
  ) = _CopyWithImpl$Mutation$updateStripePaymentInfo;

  factory CopyWith$Mutation$updateStripePaymentInfo.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateStripePaymentInfo;

  TRes call({
    Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk?
        update_service_provider_stripe_info_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk<
      TRes> get update_service_provider_stripe_info_by_pk;
}

class _CopyWithImpl$Mutation$updateStripePaymentInfo<TRes>
    implements CopyWith$Mutation$updateStripePaymentInfo<TRes> {
  _CopyWithImpl$Mutation$updateStripePaymentInfo(
    this._instance,
    this._then,
  );

  final Mutation$updateStripePaymentInfo _instance;

  final TRes Function(Mutation$updateStripePaymentInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? update_service_provider_stripe_info_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateStripePaymentInfo(
        update_service_provider_stripe_info_by_pk:
            update_service_provider_stripe_info_by_pk == _undefined
                ? _instance.update_service_provider_stripe_info_by_pk
                : (update_service_provider_stripe_info_by_pk
                    as Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk<
      TRes> get update_service_provider_stripe_info_by_pk {
    final local$update_service_provider_stripe_info_by_pk =
        _instance.update_service_provider_stripe_info_by_pk;
    return local$update_service_provider_stripe_info_by_pk == null
        ? CopyWith$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk(
            local$update_service_provider_stripe_info_by_pk,
            (e) => call(update_service_provider_stripe_info_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateStripePaymentInfo<TRes>
    implements CopyWith$Mutation$updateStripePaymentInfo<TRes> {
  _CopyWithStubImpl$Mutation$updateStripePaymentInfo(this._res);

  TRes _res;

  call({
    Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk?
        update_service_provider_stripe_info_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk<
          TRes>
      get update_service_provider_stripe_info_by_pk =>
          CopyWith$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk
              .stub(_res);
}

const documentNodeMutationupdateStripePaymentInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateStripePaymentInfo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'data')),
        type: NamedTypeNode(
          name: NameNode(value: 'service_provider_stripe_info_set_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'sp_id')),
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
        name: NameNode(value: 'update_service_provider_stripe_info_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'sp_id')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: VariableNode(name: NameNode(value: 'data')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'charge_fees_on_customer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'details_submitted'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'charges_enabled'),
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
            name: NameNode(value: 'payouts_enabled'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'requirements'),
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
            name: NameNode(value: 'status'),
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
      
    ]),
  ),
]);
Mutation$updateStripePaymentInfo _parserFn$Mutation$updateStripePaymentInfo(
        Map<String, dynamic> data) =>
    Mutation$updateStripePaymentInfo.fromJson(data);
typedef OnMutationCompleted$Mutation$updateStripePaymentInfo = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateStripePaymentInfo?,
);

class Options$Mutation$updateStripePaymentInfo
    extends graphql.MutationOptions<Mutation$updateStripePaymentInfo> {
  Options$Mutation$updateStripePaymentInfo({
    String? operationName,
    required Variables$Mutation$updateStripePaymentInfo variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateStripePaymentInfo? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateStripePaymentInfo>? update,
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
                        : _parserFn$Mutation$updateStripePaymentInfo(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateStripePaymentInfo,
          parserFn: _parserFn$Mutation$updateStripePaymentInfo,
        );

  final OnMutationCompleted$Mutation$updateStripePaymentInfo?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateStripePaymentInfo
    extends graphql.WatchQueryOptions<Mutation$updateStripePaymentInfo> {
  WatchOptions$Mutation$updateStripePaymentInfo({
    String? operationName,
    required Variables$Mutation$updateStripePaymentInfo variables,
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
          document: documentNodeMutationupdateStripePaymentInfo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateStripePaymentInfo,
        );
}

extension ClientExtension$Mutation$updateStripePaymentInfo
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateStripePaymentInfo>>
      mutate$updateStripePaymentInfo(
              Options$Mutation$updateStripePaymentInfo options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateStripePaymentInfo>
      watchMutation$updateStripePaymentInfo(
              WatchOptions$Mutation$updateStripePaymentInfo options) =>
          this.watchMutation(options);
}

class Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk {
  Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk({
    this.charge_fees_on_customer,
    required this.details_submitted,
    required this.charges_enabled,
    this.email,
    required this.payouts_enabled,
    this.requirements,
    required this.id,
    required this.status,
    required this.$__typename,
  });

  factory Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$charge_fees_on_customer = json['charge_fees_on_customer'];
    final l$details_submitted = json['details_submitted'];
    final l$charges_enabled = json['charges_enabled'];
    final l$email = json['email'];
    final l$payouts_enabled = json['payouts_enabled'];
    final l$requirements = json['requirements'];
    final l$id = json['id'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk(
      charge_fees_on_customer: (l$charge_fees_on_customer as bool?),
      details_submitted: (l$details_submitted as bool),
      charges_enabled: (l$charges_enabled as bool),
      email: (l$email as String?),
      payouts_enabled: (l$payouts_enabled as bool),
      requirements: (l$requirements as String?),
      id: (l$id as int),
      status: (l$status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool? charge_fees_on_customer;

  final bool details_submitted;

  final bool charges_enabled;

  final String? email;

  final bool payouts_enabled;

  final String? requirements;

  final int id;

  final String status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$charge_fees_on_customer = charge_fees_on_customer;
    _resultData['charge_fees_on_customer'] = l$charge_fees_on_customer;
    final l$details_submitted = details_submitted;
    _resultData['details_submitted'] = l$details_submitted;
    final l$charges_enabled = charges_enabled;
    _resultData['charges_enabled'] = l$charges_enabled;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$payouts_enabled = payouts_enabled;
    _resultData['payouts_enabled'] = l$payouts_enabled;
    final l$requirements = requirements;
    _resultData['requirements'] = l$requirements;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final l$details_submitted = details_submitted;
    final l$charges_enabled = charges_enabled;
    final l$email = email;
    final l$payouts_enabled = payouts_enabled;
    final l$requirements = requirements;
    final l$id = id;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$charge_fees_on_customer,
      l$details_submitted,
      l$charges_enabled,
      l$email,
      l$payouts_enabled,
      l$requirements,
      l$id,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$charge_fees_on_customer = charge_fees_on_customer;
    final lOther$charge_fees_on_customer = other.charge_fees_on_customer;
    if (l$charge_fees_on_customer != lOther$charge_fees_on_customer) {
      return false;
    }
    final l$details_submitted = details_submitted;
    final lOther$details_submitted = other.details_submitted;
    if (l$details_submitted != lOther$details_submitted) {
      return false;
    }
    final l$charges_enabled = charges_enabled;
    final lOther$charges_enabled = other.charges_enabled;
    if (l$charges_enabled != lOther$charges_enabled) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$payouts_enabled = payouts_enabled;
    final lOther$payouts_enabled = other.payouts_enabled;
    if (l$payouts_enabled != lOther$payouts_enabled) {
      return false;
    }
    final l$requirements = requirements;
    final lOther$requirements = other.requirements;
    if (l$requirements != lOther$requirements) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
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

extension UtilityExtension$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk
    on Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk {
  CopyWith$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk<
          Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk(
    Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk
        instance,
    TRes Function(
            Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk;

  factory CopyWith$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk;

  TRes call({
    bool? charge_fees_on_customer,
    bool? details_submitted,
    bool? charges_enabled,
    String? email,
    bool? payouts_enabled,
    String? requirements,
    int? id,
    String? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk
      _instance;

  final TRes Function(
          Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? charge_fees_on_customer = _undefined,
    Object? details_submitted = _undefined,
    Object? charges_enabled = _undefined,
    Object? email = _undefined,
    Object? payouts_enabled = _undefined,
    Object? requirements = _undefined,
    Object? id = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk(
        charge_fees_on_customer: charge_fees_on_customer == _undefined
            ? _instance.charge_fees_on_customer
            : (charge_fees_on_customer as bool?),
        details_submitted:
            details_submitted == _undefined || details_submitted == null
                ? _instance.details_submitted
                : (details_submitted as bool),
        charges_enabled:
            charges_enabled == _undefined || charges_enabled == null
                ? _instance.charges_enabled
                : (charges_enabled as bool),
        email: email == _undefined ? _instance.email : (email as String?),
        payouts_enabled:
            payouts_enabled == _undefined || payouts_enabled == null
                ? _instance.payouts_enabled
                : (payouts_enabled as bool),
        requirements: requirements == _undefined
            ? _instance.requirements
            : (requirements as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateStripePaymentInfo$update_service_provider_stripe_info_by_pk(
      this._res);

  TRes _res;

  call({
    bool? charge_fees_on_customer,
    bool? details_submitted,
    bool? charges_enabled,
    String? email,
    bool? payouts_enabled,
    String? requirements,
    int? id,
    String? status,
    String? $__typename,
  }) =>
      _res;
}
