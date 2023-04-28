import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$updateSubscriptionDataConsumption {
  factory Variables$Mutation$updateSubscriptionDataConsumption({
    String? name_of_subscription,
    int? user_id,
    int? total_size,
  }) =>
      Variables$Mutation$updateSubscriptionDataConsumption._({
        if (name_of_subscription != null)
          r'name_of_subscription': name_of_subscription,
        if (user_id != null) r'user_id': user_id,
        if (total_size != null) r'total_size': total_size,
      });

  Variables$Mutation$updateSubscriptionDataConsumption._(this._$data);

  factory Variables$Mutation$updateSubscriptionDataConsumption.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name_of_subscription')) {
      final l$name_of_subscription = data['name_of_subscription'];
      result$data['name_of_subscription'] = (l$name_of_subscription as String?);
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = (l$user_id as int?);
    }
    if (data.containsKey('total_size')) {
      final l$total_size = data['total_size'];
      result$data['total_size'] = (l$total_size as int?);
    }
    return Variables$Mutation$updateSubscriptionDataConsumption._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name_of_subscription =>
      (_$data['name_of_subscription'] as String?);
  int? get user_id => (_$data['user_id'] as int?);
  int? get total_size => (_$data['total_size'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name_of_subscription')) {
      final l$name_of_subscription = name_of_subscription;
      result$data['name_of_subscription'] = l$name_of_subscription;
    }
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] = l$user_id;
    }
    if (_$data.containsKey('total_size')) {
      final l$total_size = total_size;
      result$data['total_size'] = l$total_size;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$updateSubscriptionDataConsumption<
          Variables$Mutation$updateSubscriptionDataConsumption>
      get copyWith =>
          CopyWith$Variables$Mutation$updateSubscriptionDataConsumption(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateSubscriptionDataConsumption) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name_of_subscription = name_of_subscription;
    final lOther$name_of_subscription = other.name_of_subscription;
    if (_$data.containsKey('name_of_subscription') !=
        other._$data.containsKey('name_of_subscription')) {
      return false;
    }
    if (l$name_of_subscription != lOther$name_of_subscription) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$total_size = total_size;
    final lOther$total_size = other.total_size;
    if (_$data.containsKey('total_size') !=
        other._$data.containsKey('total_size')) {
      return false;
    }
    if (l$total_size != lOther$total_size) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name_of_subscription = name_of_subscription;
    final l$user_id = user_id;
    final l$total_size = total_size;
    return Object.hashAll([
      _$data.containsKey('name_of_subscription')
          ? l$name_of_subscription
          : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
      _$data.containsKey('total_size') ? l$total_size : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateSubscriptionDataConsumption<
    TRes> {
  factory CopyWith$Variables$Mutation$updateSubscriptionDataConsumption(
    Variables$Mutation$updateSubscriptionDataConsumption instance,
    TRes Function(Variables$Mutation$updateSubscriptionDataConsumption) then,
  ) = _CopyWithImpl$Variables$Mutation$updateSubscriptionDataConsumption;

  factory CopyWith$Variables$Mutation$updateSubscriptionDataConsumption.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateSubscriptionDataConsumption;

  TRes call({
    String? name_of_subscription,
    int? user_id,
    int? total_size,
  });
}

class _CopyWithImpl$Variables$Mutation$updateSubscriptionDataConsumption<TRes>
    implements
        CopyWith$Variables$Mutation$updateSubscriptionDataConsumption<TRes> {
  _CopyWithImpl$Variables$Mutation$updateSubscriptionDataConsumption(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateSubscriptionDataConsumption _instance;

  final TRes Function(Variables$Mutation$updateSubscriptionDataConsumption)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name_of_subscription = _undefined,
    Object? user_id = _undefined,
    Object? total_size = _undefined,
  }) =>
      _then(Variables$Mutation$updateSubscriptionDataConsumption._({
        ..._instance._$data,
        if (name_of_subscription != _undefined)
          'name_of_subscription': (name_of_subscription as String?),
        if (user_id != _undefined) 'user_id': (user_id as int?),
        if (total_size != _undefined) 'total_size': (total_size as int?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateSubscriptionDataConsumption<
        TRes>
    implements
        CopyWith$Variables$Mutation$updateSubscriptionDataConsumption<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateSubscriptionDataConsumption(
      this._res);

  TRes _res;

  call({
    String? name_of_subscription,
    int? user_id,
    int? total_size,
  }) =>
      _res;
}

class Mutation$updateSubscriptionDataConsumption {
  Mutation$updateSubscriptionDataConsumption({
    this.update_data_consumption,
    required this.$__typename,
  });

  factory Mutation$updateSubscriptionDataConsumption.fromJson(
      Map<String, dynamic> json) {
    final l$update_data_consumption = json['update_data_consumption'];
    final l$$__typename = json['__typename'];
    return Mutation$updateSubscriptionDataConsumption(
      update_data_consumption: l$update_data_consumption == null
          ? null
          : Mutation$updateSubscriptionDataConsumption$update_data_consumption
              .fromJson((l$update_data_consumption as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateSubscriptionDataConsumption$update_data_consumption?
      update_data_consumption;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_data_consumption = update_data_consumption;
    _resultData['update_data_consumption'] =
        l$update_data_consumption?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_data_consumption = update_data_consumption;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_data_consumption,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateSubscriptionDataConsumption) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_data_consumption = update_data_consumption;
    final lOther$update_data_consumption = other.update_data_consumption;
    if (l$update_data_consumption != lOther$update_data_consumption) {
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

extension UtilityExtension$Mutation$updateSubscriptionDataConsumption
    on Mutation$updateSubscriptionDataConsumption {
  CopyWith$Mutation$updateSubscriptionDataConsumption<
          Mutation$updateSubscriptionDataConsumption>
      get copyWith => CopyWith$Mutation$updateSubscriptionDataConsumption(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateSubscriptionDataConsumption<TRes> {
  factory CopyWith$Mutation$updateSubscriptionDataConsumption(
    Mutation$updateSubscriptionDataConsumption instance,
    TRes Function(Mutation$updateSubscriptionDataConsumption) then,
  ) = _CopyWithImpl$Mutation$updateSubscriptionDataConsumption;

  factory CopyWith$Mutation$updateSubscriptionDataConsumption.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateSubscriptionDataConsumption;

  TRes call({
    Mutation$updateSubscriptionDataConsumption$update_data_consumption?
        update_data_consumption,
    String? $__typename,
  });
  CopyWith$Mutation$updateSubscriptionDataConsumption$update_data_consumption<
      TRes> get update_data_consumption;
}

class _CopyWithImpl$Mutation$updateSubscriptionDataConsumption<TRes>
    implements CopyWith$Mutation$updateSubscriptionDataConsumption<TRes> {
  _CopyWithImpl$Mutation$updateSubscriptionDataConsumption(
    this._instance,
    this._then,
  );

  final Mutation$updateSubscriptionDataConsumption _instance;

  final TRes Function(Mutation$updateSubscriptionDataConsumption) _then;

  static const _undefined = {};

  TRes call({
    Object? update_data_consumption = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateSubscriptionDataConsumption(
        update_data_consumption: update_data_consumption == _undefined
            ? _instance.update_data_consumption
            : (update_data_consumption
                as Mutation$updateSubscriptionDataConsumption$update_data_consumption?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateSubscriptionDataConsumption$update_data_consumption<
      TRes> get update_data_consumption {
    final local$update_data_consumption = _instance.update_data_consumption;
    return local$update_data_consumption == null
        ? CopyWith$Mutation$updateSubscriptionDataConsumption$update_data_consumption
            .stub(_then(_instance))
        : CopyWith$Mutation$updateSubscriptionDataConsumption$update_data_consumption(
            local$update_data_consumption,
            (e) => call(update_data_consumption: e));
  }
}

class _CopyWithStubImpl$Mutation$updateSubscriptionDataConsumption<TRes>
    implements CopyWith$Mutation$updateSubscriptionDataConsumption<TRes> {
  _CopyWithStubImpl$Mutation$updateSubscriptionDataConsumption(this._res);

  TRes _res;

  call({
    Mutation$updateSubscriptionDataConsumption$update_data_consumption?
        update_data_consumption,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateSubscriptionDataConsumption$update_data_consumption<
          TRes>
      get update_data_consumption =>
          CopyWith$Mutation$updateSubscriptionDataConsumption$update_data_consumption
              .stub(_res);
}

const documentNodeMutationupdateSubscriptionDataConsumption =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateSubscriptionDataConsumption'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name_of_subscription')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'total_size')),
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
        name: NameNode(value: 'update_data_consumption'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'name_of_subscription'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(
                        name: NameNode(value: 'name_of_subscription')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'user_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'date'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'now()',
                      isBlock: false,
                    ),
                  )
                ]),
              ),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_inc'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'total_size'),
                value: VariableNode(name: NameNode(value: 'total_size')),
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
Mutation$updateSubscriptionDataConsumption
    _parserFn$Mutation$updateSubscriptionDataConsumption(
            Map<String, dynamic> data) =>
        Mutation$updateSubscriptionDataConsumption.fromJson(data);
typedef OnMutationCompleted$Mutation$updateSubscriptionDataConsumption
    = FutureOr<void> Function(
  dynamic,
  Mutation$updateSubscriptionDataConsumption?,
);

class Options$Mutation$updateSubscriptionDataConsumption extends graphql
    .MutationOptions<Mutation$updateSubscriptionDataConsumption> {
  Options$Mutation$updateSubscriptionDataConsumption({
    String? operationName,
    Variables$Mutation$updateSubscriptionDataConsumption? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateSubscriptionDataConsumption? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateSubscriptionDataConsumption>?
        update,
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
                        : _parserFn$Mutation$updateSubscriptionDataConsumption(
                            data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateSubscriptionDataConsumption,
          parserFn: _parserFn$Mutation$updateSubscriptionDataConsumption,
        );

  final OnMutationCompleted$Mutation$updateSubscriptionDataConsumption?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateSubscriptionDataConsumption extends graphql
    .WatchQueryOptions<Mutation$updateSubscriptionDataConsumption> {
  WatchOptions$Mutation$updateSubscriptionDataConsumption({
    String? operationName,
    Variables$Mutation$updateSubscriptionDataConsumption? variables,
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
          document: documentNodeMutationupdateSubscriptionDataConsumption,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateSubscriptionDataConsumption,
        );
}

extension ClientExtension$Mutation$updateSubscriptionDataConsumption
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateSubscriptionDataConsumption>>
      mutate$updateSubscriptionDataConsumption(
              [Options$Mutation$updateSubscriptionDataConsumption?
                  options]) async =>
          await this.mutate(
              options ?? Options$Mutation$updateSubscriptionDataConsumption());
  graphql.ObservableQuery<Mutation$updateSubscriptionDataConsumption>
      watchMutation$updateSubscriptionDataConsumption(
              [WatchOptions$Mutation$updateSubscriptionDataConsumption?
                  options]) =>
          this.watchMutation(options ??
              WatchOptions$Mutation$updateSubscriptionDataConsumption());
}

class Mutation$updateSubscriptionDataConsumption$update_data_consumption {
  Mutation$updateSubscriptionDataConsumption$update_data_consumption({
    required this.affected_rows,
    required this.$__typename,
  });

  factory Mutation$updateSubscriptionDataConsumption$update_data_consumption.fromJson(
      Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$$__typename = json['__typename'];
    return Mutation$updateSubscriptionDataConsumption$update_data_consumption(
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
    if (!(other
            is Mutation$updateSubscriptionDataConsumption$update_data_consumption) ||
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

extension UtilityExtension$Mutation$updateSubscriptionDataConsumption$update_data_consumption
    on Mutation$updateSubscriptionDataConsumption$update_data_consumption {
  CopyWith$Mutation$updateSubscriptionDataConsumption$update_data_consumption<
          Mutation$updateSubscriptionDataConsumption$update_data_consumption>
      get copyWith =>
          CopyWith$Mutation$updateSubscriptionDataConsumption$update_data_consumption(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateSubscriptionDataConsumption$update_data_consumption<
    TRes> {
  factory CopyWith$Mutation$updateSubscriptionDataConsumption$update_data_consumption(
    Mutation$updateSubscriptionDataConsumption$update_data_consumption instance,
    TRes Function(
            Mutation$updateSubscriptionDataConsumption$update_data_consumption)
        then,
  ) = _CopyWithImpl$Mutation$updateSubscriptionDataConsumption$update_data_consumption;

  factory CopyWith$Mutation$updateSubscriptionDataConsumption$update_data_consumption.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateSubscriptionDataConsumption$update_data_consumption;

  TRes call({
    int? affected_rows,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateSubscriptionDataConsumption$update_data_consumption<
        TRes>
    implements
        CopyWith$Mutation$updateSubscriptionDataConsumption$update_data_consumption<
            TRes> {
  _CopyWithImpl$Mutation$updateSubscriptionDataConsumption$update_data_consumption(
    this._instance,
    this._then,
  );

  final Mutation$updateSubscriptionDataConsumption$update_data_consumption
      _instance;

  final TRes Function(
      Mutation$updateSubscriptionDataConsumption$update_data_consumption) _then;

  static const _undefined = {};

  TRes call({
    Object? affected_rows = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateSubscriptionDataConsumption$update_data_consumption(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateSubscriptionDataConsumption$update_data_consumption<
        TRes>
    implements
        CopyWith$Mutation$updateSubscriptionDataConsumption$update_data_consumption<
            TRes> {
  _CopyWithStubImpl$Mutation$updateSubscriptionDataConsumption$update_data_consumption(
      this._res);

  TRes _res;

  call({
    int? affected_rows,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$insertSubscriptionDataConsumption {
  factory Variables$Mutation$insertSubscriptionDataConsumption({
    String? name_of_subscription,
    int? total_size,
    int? user_id,
  }) =>
      Variables$Mutation$insertSubscriptionDataConsumption._({
        if (name_of_subscription != null)
          r'name_of_subscription': name_of_subscription,
        if (total_size != null) r'total_size': total_size,
        if (user_id != null) r'user_id': user_id,
      });

  Variables$Mutation$insertSubscriptionDataConsumption._(this._$data);

  factory Variables$Mutation$insertSubscriptionDataConsumption.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name_of_subscription')) {
      final l$name_of_subscription = data['name_of_subscription'];
      result$data['name_of_subscription'] = (l$name_of_subscription as String?);
    }
    if (data.containsKey('total_size')) {
      final l$total_size = data['total_size'];
      result$data['total_size'] = (l$total_size as int?);
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = (l$user_id as int?);
    }
    return Variables$Mutation$insertSubscriptionDataConsumption._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name_of_subscription =>
      (_$data['name_of_subscription'] as String?);
  int? get total_size => (_$data['total_size'] as int?);
  int? get user_id => (_$data['user_id'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name_of_subscription')) {
      final l$name_of_subscription = name_of_subscription;
      result$data['name_of_subscription'] = l$name_of_subscription;
    }
    if (_$data.containsKey('total_size')) {
      final l$total_size = total_size;
      result$data['total_size'] = l$total_size;
    }
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] = l$user_id;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$insertSubscriptionDataConsumption<
          Variables$Mutation$insertSubscriptionDataConsumption>
      get copyWith =>
          CopyWith$Variables$Mutation$insertSubscriptionDataConsumption(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$insertSubscriptionDataConsumption) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name_of_subscription = name_of_subscription;
    final lOther$name_of_subscription = other.name_of_subscription;
    if (_$data.containsKey('name_of_subscription') !=
        other._$data.containsKey('name_of_subscription')) {
      return false;
    }
    if (l$name_of_subscription != lOther$name_of_subscription) {
      return false;
    }
    final l$total_size = total_size;
    final lOther$total_size = other.total_size;
    if (_$data.containsKey('total_size') !=
        other._$data.containsKey('total_size')) {
      return false;
    }
    if (l$total_size != lOther$total_size) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name_of_subscription = name_of_subscription;
    final l$total_size = total_size;
    final l$user_id = user_id;
    return Object.hashAll([
      _$data.containsKey('name_of_subscription')
          ? l$name_of_subscription
          : const {},
      _$data.containsKey('total_size') ? l$total_size : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$insertSubscriptionDataConsumption<
    TRes> {
  factory CopyWith$Variables$Mutation$insertSubscriptionDataConsumption(
    Variables$Mutation$insertSubscriptionDataConsumption instance,
    TRes Function(Variables$Mutation$insertSubscriptionDataConsumption) then,
  ) = _CopyWithImpl$Variables$Mutation$insertSubscriptionDataConsumption;

  factory CopyWith$Variables$Mutation$insertSubscriptionDataConsumption.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$insertSubscriptionDataConsumption;

  TRes call({
    String? name_of_subscription,
    int? total_size,
    int? user_id,
  });
}

class _CopyWithImpl$Variables$Mutation$insertSubscriptionDataConsumption<TRes>
    implements
        CopyWith$Variables$Mutation$insertSubscriptionDataConsumption<TRes> {
  _CopyWithImpl$Variables$Mutation$insertSubscriptionDataConsumption(
    this._instance,
    this._then,
  );

  final Variables$Mutation$insertSubscriptionDataConsumption _instance;

  final TRes Function(Variables$Mutation$insertSubscriptionDataConsumption)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name_of_subscription = _undefined,
    Object? total_size = _undefined,
    Object? user_id = _undefined,
  }) =>
      _then(Variables$Mutation$insertSubscriptionDataConsumption._({
        ..._instance._$data,
        if (name_of_subscription != _undefined)
          'name_of_subscription': (name_of_subscription as String?),
        if (total_size != _undefined) 'total_size': (total_size as int?),
        if (user_id != _undefined) 'user_id': (user_id as int?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$insertSubscriptionDataConsumption<
        TRes>
    implements
        CopyWith$Variables$Mutation$insertSubscriptionDataConsumption<TRes> {
  _CopyWithStubImpl$Variables$Mutation$insertSubscriptionDataConsumption(
      this._res);

  TRes _res;

  call({
    String? name_of_subscription,
    int? total_size,
    int? user_id,
  }) =>
      _res;
}

class Mutation$insertSubscriptionDataConsumption {
  Mutation$insertSubscriptionDataConsumption({
    this.insert_data_consumption_one,
    required this.$__typename,
  });

  factory Mutation$insertSubscriptionDataConsumption.fromJson(
      Map<String, dynamic> json) {
    final l$insert_data_consumption_one = json['insert_data_consumption_one'];
    final l$$__typename = json['__typename'];
    return Mutation$insertSubscriptionDataConsumption(
      insert_data_consumption_one: l$insert_data_consumption_one == null
          ? null
          : Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one
              .fromJson(
                  (l$insert_data_consumption_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one?
      insert_data_consumption_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_data_consumption_one = insert_data_consumption_one;
    _resultData['insert_data_consumption_one'] =
        l$insert_data_consumption_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_data_consumption_one = insert_data_consumption_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_data_consumption_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$insertSubscriptionDataConsumption) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_data_consumption_one = insert_data_consumption_one;
    final lOther$insert_data_consumption_one =
        other.insert_data_consumption_one;
    if (l$insert_data_consumption_one != lOther$insert_data_consumption_one) {
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

extension UtilityExtension$Mutation$insertSubscriptionDataConsumption
    on Mutation$insertSubscriptionDataConsumption {
  CopyWith$Mutation$insertSubscriptionDataConsumption<
          Mutation$insertSubscriptionDataConsumption>
      get copyWith => CopyWith$Mutation$insertSubscriptionDataConsumption(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$insertSubscriptionDataConsumption<TRes> {
  factory CopyWith$Mutation$insertSubscriptionDataConsumption(
    Mutation$insertSubscriptionDataConsumption instance,
    TRes Function(Mutation$insertSubscriptionDataConsumption) then,
  ) = _CopyWithImpl$Mutation$insertSubscriptionDataConsumption;

  factory CopyWith$Mutation$insertSubscriptionDataConsumption.stub(TRes res) =
      _CopyWithStubImpl$Mutation$insertSubscriptionDataConsumption;

  TRes call({
    Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one?
        insert_data_consumption_one,
    String? $__typename,
  });
  CopyWith$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one<
      TRes> get insert_data_consumption_one;
}

class _CopyWithImpl$Mutation$insertSubscriptionDataConsumption<TRes>
    implements CopyWith$Mutation$insertSubscriptionDataConsumption<TRes> {
  _CopyWithImpl$Mutation$insertSubscriptionDataConsumption(
    this._instance,
    this._then,
  );

  final Mutation$insertSubscriptionDataConsumption _instance;

  final TRes Function(Mutation$insertSubscriptionDataConsumption) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_data_consumption_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$insertSubscriptionDataConsumption(
        insert_data_consumption_one: insert_data_consumption_one == _undefined
            ? _instance.insert_data_consumption_one
            : (insert_data_consumption_one
                as Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one<
      TRes> get insert_data_consumption_one {
    final local$insert_data_consumption_one =
        _instance.insert_data_consumption_one;
    return local$insert_data_consumption_one == null
        ? CopyWith$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one
            .stub(_then(_instance))
        : CopyWith$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one(
            local$insert_data_consumption_one,
            (e) => call(insert_data_consumption_one: e));
  }
}

class _CopyWithStubImpl$Mutation$insertSubscriptionDataConsumption<TRes>
    implements CopyWith$Mutation$insertSubscriptionDataConsumption<TRes> {
  _CopyWithStubImpl$Mutation$insertSubscriptionDataConsumption(this._res);

  TRes _res;

  call({
    Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one?
        insert_data_consumption_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one<
          TRes>
      get insert_data_consumption_one =>
          CopyWith$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one
              .stub(_res);
}

const documentNodeMutationinsertSubscriptionDataConsumption =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'insertSubscriptionDataConsumption'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name_of_subscription')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'total_size')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
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
        name: NameNode(value: 'insert_data_consumption_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'name_of_subscription'),
                value:
                    VariableNode(name: NameNode(value: 'name_of_subscription')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'total_size'),
                value: VariableNode(name: NameNode(value: 'total_size')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: VariableNode(name: NameNode(value: 'user_id')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'date'),
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
Mutation$insertSubscriptionDataConsumption
    _parserFn$Mutation$insertSubscriptionDataConsumption(
            Map<String, dynamic> data) =>
        Mutation$insertSubscriptionDataConsumption.fromJson(data);
typedef OnMutationCompleted$Mutation$insertSubscriptionDataConsumption
    = FutureOr<void> Function(
  dynamic,
  Mutation$insertSubscriptionDataConsumption?,
);

class Options$Mutation$insertSubscriptionDataConsumption extends graphql
    .MutationOptions<Mutation$insertSubscriptionDataConsumption> {
  Options$Mutation$insertSubscriptionDataConsumption({
    String? operationName,
    Variables$Mutation$insertSubscriptionDataConsumption? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$insertSubscriptionDataConsumption? onCompleted,
    graphql.OnMutationUpdate<Mutation$insertSubscriptionDataConsumption>?
        update,
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
                        : _parserFn$Mutation$insertSubscriptionDataConsumption(
                            data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationinsertSubscriptionDataConsumption,
          parserFn: _parserFn$Mutation$insertSubscriptionDataConsumption,
        );

  final OnMutationCompleted$Mutation$insertSubscriptionDataConsumption?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$insertSubscriptionDataConsumption extends graphql
    .WatchQueryOptions<Mutation$insertSubscriptionDataConsumption> {
  WatchOptions$Mutation$insertSubscriptionDataConsumption({
    String? operationName,
    Variables$Mutation$insertSubscriptionDataConsumption? variables,
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
          document: documentNodeMutationinsertSubscriptionDataConsumption,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$insertSubscriptionDataConsumption,
        );
}

extension ClientExtension$Mutation$insertSubscriptionDataConsumption
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$insertSubscriptionDataConsumption>>
      mutate$insertSubscriptionDataConsumption(
              [Options$Mutation$insertSubscriptionDataConsumption?
                  options]) async =>
          await this.mutate(
              options ?? Options$Mutation$insertSubscriptionDataConsumption());
  graphql.ObservableQuery<Mutation$insertSubscriptionDataConsumption>
      watchMutation$insertSubscriptionDataConsumption(
              [WatchOptions$Mutation$insertSubscriptionDataConsumption?
                  options]) =>
          this.watchMutation(options ??
              WatchOptions$Mutation$insertSubscriptionDataConsumption());
}

class Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one {
  Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one({
    required this.date,
    required this.$__typename,
  });

  factory Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one.fromJson(
      Map<String, dynamic> json) {
    final l$date = json['date'];
    final l$$__typename = json['__typename'];
    return Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one(
      date: (l$date as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String date;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$date = date;
    _resultData['date'] = l$date;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$date = date;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$date,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$date = date;
    final lOther$date = other.date;
    if (l$date != lOther$date) {
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

extension UtilityExtension$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one
    on Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one {
  CopyWith$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one<
          Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one>
      get copyWith =>
          CopyWith$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one<
    TRes> {
  factory CopyWith$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one(
    Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one
        instance,
    TRes Function(
            Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one)
        then,
  ) = _CopyWithImpl$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one;

  factory CopyWith$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one;

  TRes call({
    String? date,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one<
        TRes>
    implements
        CopyWith$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one<
            TRes> {
  _CopyWithImpl$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one(
    this._instance,
    this._then,
  );

  final Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one
      _instance;

  final TRes Function(
          Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? date = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one(
        date: date == _undefined || date == null
            ? _instance.date
            : (date as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one<
        TRes>
    implements
        CopyWith$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one<
            TRes> {
  _CopyWithStubImpl$Mutation$insertSubscriptionDataConsumption$insert_data_consumption_one(
      this._res);

  TRes _res;

  call({
    String? date,
    String? $__typename,
  }) =>
      _res;
}
