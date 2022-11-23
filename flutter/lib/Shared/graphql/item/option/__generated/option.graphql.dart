import '../../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Mutation$addOption {
  factory Variables$Mutation$addOption(
          {required Input$restaurant_option_insert_input option}) =>
      Variables$Mutation$addOption._({
        r'option': option,
      });

  Variables$Mutation$addOption._(this._$data);

  factory Variables$Mutation$addOption.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$option = data['option'];
    result$data['option'] = Input$restaurant_option_insert_input.fromJson(
        (l$option as Map<String, dynamic>));
    return Variables$Mutation$addOption._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$restaurant_option_insert_input get option =>
      (_$data['option'] as Input$restaurant_option_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$option = option;
    result$data['option'] = l$option.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$addOption<Variables$Mutation$addOption>
      get copyWith => CopyWith$Variables$Mutation$addOption(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addOption) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$option = option;
    final lOther$option = other.option;
    if (l$option != lOther$option) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$option = option;
    return Object.hashAll([l$option]);
  }
}

abstract class CopyWith$Variables$Mutation$addOption<TRes> {
  factory CopyWith$Variables$Mutation$addOption(
    Variables$Mutation$addOption instance,
    TRes Function(Variables$Mutation$addOption) then,
  ) = _CopyWithImpl$Variables$Mutation$addOption;

  factory CopyWith$Variables$Mutation$addOption.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addOption;

  TRes call({Input$restaurant_option_insert_input? option});
}

class _CopyWithImpl$Variables$Mutation$addOption<TRes>
    implements CopyWith$Variables$Mutation$addOption<TRes> {
  _CopyWithImpl$Variables$Mutation$addOption(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addOption _instance;

  final TRes Function(Variables$Mutation$addOption) _then;

  static const _undefined = {};

  TRes call({Object? option = _undefined}) =>
      _then(Variables$Mutation$addOption._({
        ..._instance._$data,
        if (option != _undefined && option != null)
          'option': (option as Input$restaurant_option_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addOption<TRes>
    implements CopyWith$Variables$Mutation$addOption<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addOption(this._res);

  TRes _res;

  call({Input$restaurant_option_insert_input? option}) => _res;
}

class Mutation$addOption {
  Mutation$addOption({
    this.insert_restaurant_option_one,
    required this.$__typename,
  });

  factory Mutation$addOption.fromJson(Map<String, dynamic> json) {
    final l$insert_restaurant_option_one = json['insert_restaurant_option_one'];
    final l$$__typename = json['__typename'];
    return Mutation$addOption(
      insert_restaurant_option_one: l$insert_restaurant_option_one == null
          ? null
          : Mutation$addOption$insert_restaurant_option_one.fromJson(
              (l$insert_restaurant_option_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addOption$insert_restaurant_option_one?
      insert_restaurant_option_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_restaurant_option_one = insert_restaurant_option_one;
    _resultData['insert_restaurant_option_one'] =
        l$insert_restaurant_option_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_restaurant_option_one = insert_restaurant_option_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_restaurant_option_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addOption) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_restaurant_option_one = insert_restaurant_option_one;
    final lOther$insert_restaurant_option_one =
        other.insert_restaurant_option_one;
    if (l$insert_restaurant_option_one != lOther$insert_restaurant_option_one) {
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

extension UtilityExtension$Mutation$addOption on Mutation$addOption {
  CopyWith$Mutation$addOption<Mutation$addOption> get copyWith =>
      CopyWith$Mutation$addOption(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$addOption<TRes> {
  factory CopyWith$Mutation$addOption(
    Mutation$addOption instance,
    TRes Function(Mutation$addOption) then,
  ) = _CopyWithImpl$Mutation$addOption;

  factory CopyWith$Mutation$addOption.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addOption;

  TRes call({
    Mutation$addOption$insert_restaurant_option_one?
        insert_restaurant_option_one,
    String? $__typename,
  });
  CopyWith$Mutation$addOption$insert_restaurant_option_one<TRes>
      get insert_restaurant_option_one;
}

class _CopyWithImpl$Mutation$addOption<TRes>
    implements CopyWith$Mutation$addOption<TRes> {
  _CopyWithImpl$Mutation$addOption(
    this._instance,
    this._then,
  );

  final Mutation$addOption _instance;

  final TRes Function(Mutation$addOption) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_restaurant_option_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addOption(
        insert_restaurant_option_one: insert_restaurant_option_one == _undefined
            ? _instance.insert_restaurant_option_one
            : (insert_restaurant_option_one
                as Mutation$addOption$insert_restaurant_option_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addOption$insert_restaurant_option_one<TRes>
      get insert_restaurant_option_one {
    final local$insert_restaurant_option_one =
        _instance.insert_restaurant_option_one;
    return local$insert_restaurant_option_one == null
        ? CopyWith$Mutation$addOption$insert_restaurant_option_one.stub(
            _then(_instance))
        : CopyWith$Mutation$addOption$insert_restaurant_option_one(
            local$insert_restaurant_option_one,
            (e) => call(insert_restaurant_option_one: e));
  }
}

class _CopyWithStubImpl$Mutation$addOption<TRes>
    implements CopyWith$Mutation$addOption<TRes> {
  _CopyWithStubImpl$Mutation$addOption(this._res);

  TRes _res;

  call({
    Mutation$addOption$insert_restaurant_option_one?
        insert_restaurant_option_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addOption$insert_restaurant_option_one<TRes>
      get insert_restaurant_option_one =>
          CopyWith$Mutation$addOption$insert_restaurant_option_one.stub(_res);
}

const documentNodeMutationaddOption = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addOption'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'option')),
        type: NamedTypeNode(
          name: NameNode(value: 'restaurant_option_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_restaurant_option_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'option')),
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
Mutation$addOption _parserFn$Mutation$addOption(Map<String, dynamic> data) =>
    Mutation$addOption.fromJson(data);
typedef OnMutationCompleted$Mutation$addOption = FutureOr<void> Function(
  dynamic,
  Mutation$addOption?,
);

class Options$Mutation$addOption
    extends graphql.MutationOptions<Mutation$addOption> {
  Options$Mutation$addOption({
    String? operationName,
    required Variables$Mutation$addOption variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addOption? onCompleted,
    graphql.OnMutationUpdate<Mutation$addOption>? update,
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
                    data == null ? null : _parserFn$Mutation$addOption(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddOption,
          parserFn: _parserFn$Mutation$addOption,
        );

  final OnMutationCompleted$Mutation$addOption? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addOption
    extends graphql.WatchQueryOptions<Mutation$addOption> {
  WatchOptions$Mutation$addOption({
    String? operationName,
    required Variables$Mutation$addOption variables,
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
          document: documentNodeMutationaddOption,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addOption,
        );
}

extension ClientExtension$Mutation$addOption on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addOption>> mutate$addOption(
          Options$Mutation$addOption options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$addOption> watchMutation$addOption(
          WatchOptions$Mutation$addOption options) =>
      this.watchMutation(options);
}

class Mutation$addOption$insert_restaurant_option_one {
  Mutation$addOption$insert_restaurant_option_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$addOption$insert_restaurant_option_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$addOption$insert_restaurant_option_one(
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
    if (!(other is Mutation$addOption$insert_restaurant_option_one) ||
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

extension UtilityExtension$Mutation$addOption$insert_restaurant_option_one
    on Mutation$addOption$insert_restaurant_option_one {
  CopyWith$Mutation$addOption$insert_restaurant_option_one<
          Mutation$addOption$insert_restaurant_option_one>
      get copyWith => CopyWith$Mutation$addOption$insert_restaurant_option_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addOption$insert_restaurant_option_one<TRes> {
  factory CopyWith$Mutation$addOption$insert_restaurant_option_one(
    Mutation$addOption$insert_restaurant_option_one instance,
    TRes Function(Mutation$addOption$insert_restaurant_option_one) then,
  ) = _CopyWithImpl$Mutation$addOption$insert_restaurant_option_one;

  factory CopyWith$Mutation$addOption$insert_restaurant_option_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addOption$insert_restaurant_option_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addOption$insert_restaurant_option_one<TRes>
    implements CopyWith$Mutation$addOption$insert_restaurant_option_one<TRes> {
  _CopyWithImpl$Mutation$addOption$insert_restaurant_option_one(
    this._instance,
    this._then,
  );

  final Mutation$addOption$insert_restaurant_option_one _instance;

  final TRes Function(Mutation$addOption$insert_restaurant_option_one) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addOption$insert_restaurant_option_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addOption$insert_restaurant_option_one<TRes>
    implements CopyWith$Mutation$addOption$insert_restaurant_option_one<TRes> {
  _CopyWithStubImpl$Mutation$addOption$insert_restaurant_option_one(this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateOption {
  factory Variables$Mutation$updateOption({
    required int optionId,
    required Input$restaurant_option_set_input optionData,
  }) =>
      Variables$Mutation$updateOption._({
        r'optionId': optionId,
        r'optionData': optionData,
      });

  Variables$Mutation$updateOption._(this._$data);

  factory Variables$Mutation$updateOption.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$optionId = data['optionId'];
    result$data['optionId'] = (l$optionId as int);
    final l$optionData = data['optionData'];
    result$data['optionData'] = Input$restaurant_option_set_input.fromJson(
        (l$optionData as Map<String, dynamic>));
    return Variables$Mutation$updateOption._(result$data);
  }

  Map<String, dynamic> _$data;

  int get optionId => (_$data['optionId'] as int);
  Input$restaurant_option_set_input get optionData =>
      (_$data['optionData'] as Input$restaurant_option_set_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$optionId = optionId;
    result$data['optionId'] = l$optionId;
    final l$optionData = optionData;
    result$data['optionData'] = l$optionData.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateOption<Variables$Mutation$updateOption>
      get copyWith => CopyWith$Variables$Mutation$updateOption(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateOption) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$optionId = optionId;
    final lOther$optionId = other.optionId;
    if (l$optionId != lOther$optionId) {
      return false;
    }
    final l$optionData = optionData;
    final lOther$optionData = other.optionData;
    if (l$optionData != lOther$optionData) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$optionId = optionId;
    final l$optionData = optionData;
    return Object.hashAll([
      l$optionId,
      l$optionData,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateOption<TRes> {
  factory CopyWith$Variables$Mutation$updateOption(
    Variables$Mutation$updateOption instance,
    TRes Function(Variables$Mutation$updateOption) then,
  ) = _CopyWithImpl$Variables$Mutation$updateOption;

  factory CopyWith$Variables$Mutation$updateOption.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateOption;

  TRes call({
    int? optionId,
    Input$restaurant_option_set_input? optionData,
  });
}

class _CopyWithImpl$Variables$Mutation$updateOption<TRes>
    implements CopyWith$Variables$Mutation$updateOption<TRes> {
  _CopyWithImpl$Variables$Mutation$updateOption(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateOption _instance;

  final TRes Function(Variables$Mutation$updateOption) _then;

  static const _undefined = {};

  TRes call({
    Object? optionId = _undefined,
    Object? optionData = _undefined,
  }) =>
      _then(Variables$Mutation$updateOption._({
        ..._instance._$data,
        if (optionId != _undefined && optionId != null)
          'optionId': (optionId as int),
        if (optionData != _undefined && optionData != null)
          'optionData': (optionData as Input$restaurant_option_set_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateOption<TRes>
    implements CopyWith$Variables$Mutation$updateOption<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateOption(this._res);

  TRes _res;

  call({
    int? optionId,
    Input$restaurant_option_set_input? optionData,
  }) =>
      _res;
}

class Mutation$updateOption {
  Mutation$updateOption({
    this.update_restaurant_option_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateOption.fromJson(Map<String, dynamic> json) {
    final l$update_restaurant_option_by_pk =
        json['update_restaurant_option_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateOption(
      update_restaurant_option_by_pk: l$update_restaurant_option_by_pk == null
          ? null
          : Mutation$updateOption$update_restaurant_option_by_pk.fromJson(
              (l$update_restaurant_option_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateOption$update_restaurant_option_by_pk?
      update_restaurant_option_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_restaurant_option_by_pk = update_restaurant_option_by_pk;
    _resultData['update_restaurant_option_by_pk'] =
        l$update_restaurant_option_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_restaurant_option_by_pk = update_restaurant_option_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_restaurant_option_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateOption) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_restaurant_option_by_pk = update_restaurant_option_by_pk;
    final lOther$update_restaurant_option_by_pk =
        other.update_restaurant_option_by_pk;
    if (l$update_restaurant_option_by_pk !=
        lOther$update_restaurant_option_by_pk) {
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

extension UtilityExtension$Mutation$updateOption on Mutation$updateOption {
  CopyWith$Mutation$updateOption<Mutation$updateOption> get copyWith =>
      CopyWith$Mutation$updateOption(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$updateOption<TRes> {
  factory CopyWith$Mutation$updateOption(
    Mutation$updateOption instance,
    TRes Function(Mutation$updateOption) then,
  ) = _CopyWithImpl$Mutation$updateOption;

  factory CopyWith$Mutation$updateOption.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateOption;

  TRes call({
    Mutation$updateOption$update_restaurant_option_by_pk?
        update_restaurant_option_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateOption$update_restaurant_option_by_pk<TRes>
      get update_restaurant_option_by_pk;
}

class _CopyWithImpl$Mutation$updateOption<TRes>
    implements CopyWith$Mutation$updateOption<TRes> {
  _CopyWithImpl$Mutation$updateOption(
    this._instance,
    this._then,
  );

  final Mutation$updateOption _instance;

  final TRes Function(Mutation$updateOption) _then;

  static const _undefined = {};

  TRes call({
    Object? update_restaurant_option_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateOption(
        update_restaurant_option_by_pk:
            update_restaurant_option_by_pk == _undefined
                ? _instance.update_restaurant_option_by_pk
                : (update_restaurant_option_by_pk
                    as Mutation$updateOption$update_restaurant_option_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateOption$update_restaurant_option_by_pk<TRes>
      get update_restaurant_option_by_pk {
    final local$update_restaurant_option_by_pk =
        _instance.update_restaurant_option_by_pk;
    return local$update_restaurant_option_by_pk == null
        ? CopyWith$Mutation$updateOption$update_restaurant_option_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$updateOption$update_restaurant_option_by_pk(
            local$update_restaurant_option_by_pk,
            (e) => call(update_restaurant_option_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateOption<TRes>
    implements CopyWith$Mutation$updateOption<TRes> {
  _CopyWithStubImpl$Mutation$updateOption(this._res);

  TRes _res;

  call({
    Mutation$updateOption$update_restaurant_option_by_pk?
        update_restaurant_option_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateOption$update_restaurant_option_by_pk<TRes>
      get update_restaurant_option_by_pk =>
          CopyWith$Mutation$updateOption$update_restaurant_option_by_pk.stub(
              _res);
}

const documentNodeMutationupdateOption = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateOption'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'optionId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'optionData')),
        type: NamedTypeNode(
          name: NameNode(value: 'restaurant_option_set_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_restaurant_option_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: VariableNode(name: NameNode(value: 'optionData')),
          ),
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'optionId')),
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
Mutation$updateOption _parserFn$Mutation$updateOption(
        Map<String, dynamic> data) =>
    Mutation$updateOption.fromJson(data);
typedef OnMutationCompleted$Mutation$updateOption = FutureOr<void> Function(
  dynamic,
  Mutation$updateOption?,
);

class Options$Mutation$updateOption
    extends graphql.MutationOptions<Mutation$updateOption> {
  Options$Mutation$updateOption({
    String? operationName,
    required Variables$Mutation$updateOption variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateOption? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateOption>? update,
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
                    data == null ? null : _parserFn$Mutation$updateOption(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateOption,
          parserFn: _parserFn$Mutation$updateOption,
        );

  final OnMutationCompleted$Mutation$updateOption? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateOption
    extends graphql.WatchQueryOptions<Mutation$updateOption> {
  WatchOptions$Mutation$updateOption({
    String? operationName,
    required Variables$Mutation$updateOption variables,
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
          document: documentNodeMutationupdateOption,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateOption,
        );
}

extension ClientExtension$Mutation$updateOption on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateOption>> mutate$updateOption(
          Options$Mutation$updateOption options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateOption> watchMutation$updateOption(
          WatchOptions$Mutation$updateOption options) =>
      this.watchMutation(options);
}

class Mutation$updateOption$update_restaurant_option_by_pk {
  Mutation$updateOption$update_restaurant_option_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$updateOption$update_restaurant_option_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$updateOption$update_restaurant_option_by_pk(
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
    if (!(other is Mutation$updateOption$update_restaurant_option_by_pk) ||
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

extension UtilityExtension$Mutation$updateOption$update_restaurant_option_by_pk
    on Mutation$updateOption$update_restaurant_option_by_pk {
  CopyWith$Mutation$updateOption$update_restaurant_option_by_pk<
          Mutation$updateOption$update_restaurant_option_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateOption$update_restaurant_option_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateOption$update_restaurant_option_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateOption$update_restaurant_option_by_pk(
    Mutation$updateOption$update_restaurant_option_by_pk instance,
    TRes Function(Mutation$updateOption$update_restaurant_option_by_pk) then,
  ) = _CopyWithImpl$Mutation$updateOption$update_restaurant_option_by_pk;

  factory CopyWith$Mutation$updateOption$update_restaurant_option_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateOption$update_restaurant_option_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateOption$update_restaurant_option_by_pk<TRes>
    implements
        CopyWith$Mutation$updateOption$update_restaurant_option_by_pk<TRes> {
  _CopyWithImpl$Mutation$updateOption$update_restaurant_option_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateOption$update_restaurant_option_by_pk _instance;

  final TRes Function(Mutation$updateOption$update_restaurant_option_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateOption$update_restaurant_option_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateOption$update_restaurant_option_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateOption$update_restaurant_option_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$updateOption$update_restaurant_option_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$deleteOptionbyId {
  factory Variables$Mutation$deleteOptionbyId({required int id}) =>
      Variables$Mutation$deleteOptionbyId._({
        r'id': id,
      });

  Variables$Mutation$deleteOptionbyId._(this._$data);

  factory Variables$Mutation$deleteOptionbyId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Mutation$deleteOptionbyId._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$deleteOptionbyId<
          Variables$Mutation$deleteOptionbyId>
      get copyWith => CopyWith$Variables$Mutation$deleteOptionbyId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$deleteOptionbyId) ||
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

abstract class CopyWith$Variables$Mutation$deleteOptionbyId<TRes> {
  factory CopyWith$Variables$Mutation$deleteOptionbyId(
    Variables$Mutation$deleteOptionbyId instance,
    TRes Function(Variables$Mutation$deleteOptionbyId) then,
  ) = _CopyWithImpl$Variables$Mutation$deleteOptionbyId;

  factory CopyWith$Variables$Mutation$deleteOptionbyId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$deleteOptionbyId;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Mutation$deleteOptionbyId<TRes>
    implements CopyWith$Variables$Mutation$deleteOptionbyId<TRes> {
  _CopyWithImpl$Variables$Mutation$deleteOptionbyId(
    this._instance,
    this._then,
  );

  final Variables$Mutation$deleteOptionbyId _instance;

  final TRes Function(Variables$Mutation$deleteOptionbyId) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$deleteOptionbyId._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$deleteOptionbyId<TRes>
    implements CopyWith$Variables$Mutation$deleteOptionbyId<TRes> {
  _CopyWithStubImpl$Variables$Mutation$deleteOptionbyId(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Mutation$deleteOptionbyId {
  Mutation$deleteOptionbyId({
    this.delete_restaurant_option_by_pk,
    required this.$__typename,
  });

  factory Mutation$deleteOptionbyId.fromJson(Map<String, dynamic> json) {
    final l$delete_restaurant_option_by_pk =
        json['delete_restaurant_option_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteOptionbyId(
      delete_restaurant_option_by_pk: l$delete_restaurant_option_by_pk == null
          ? null
          : Mutation$deleteOptionbyId$delete_restaurant_option_by_pk.fromJson(
              (l$delete_restaurant_option_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$deleteOptionbyId$delete_restaurant_option_by_pk?
      delete_restaurant_option_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_restaurant_option_by_pk = delete_restaurant_option_by_pk;
    _resultData['delete_restaurant_option_by_pk'] =
        l$delete_restaurant_option_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_restaurant_option_by_pk = delete_restaurant_option_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_restaurant_option_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteOptionbyId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_restaurant_option_by_pk = delete_restaurant_option_by_pk;
    final lOther$delete_restaurant_option_by_pk =
        other.delete_restaurant_option_by_pk;
    if (l$delete_restaurant_option_by_pk !=
        lOther$delete_restaurant_option_by_pk) {
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

extension UtilityExtension$Mutation$deleteOptionbyId
    on Mutation$deleteOptionbyId {
  CopyWith$Mutation$deleteOptionbyId<Mutation$deleteOptionbyId> get copyWith =>
      CopyWith$Mutation$deleteOptionbyId(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$deleteOptionbyId<TRes> {
  factory CopyWith$Mutation$deleteOptionbyId(
    Mutation$deleteOptionbyId instance,
    TRes Function(Mutation$deleteOptionbyId) then,
  ) = _CopyWithImpl$Mutation$deleteOptionbyId;

  factory CopyWith$Mutation$deleteOptionbyId.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteOptionbyId;

  TRes call({
    Mutation$deleteOptionbyId$delete_restaurant_option_by_pk?
        delete_restaurant_option_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk<TRes>
      get delete_restaurant_option_by_pk;
}

class _CopyWithImpl$Mutation$deleteOptionbyId<TRes>
    implements CopyWith$Mutation$deleteOptionbyId<TRes> {
  _CopyWithImpl$Mutation$deleteOptionbyId(
    this._instance,
    this._then,
  );

  final Mutation$deleteOptionbyId _instance;

  final TRes Function(Mutation$deleteOptionbyId) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_restaurant_option_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteOptionbyId(
        delete_restaurant_option_by_pk: delete_restaurant_option_by_pk ==
                _undefined
            ? _instance.delete_restaurant_option_by_pk
            : (delete_restaurant_option_by_pk
                as Mutation$deleteOptionbyId$delete_restaurant_option_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk<TRes>
      get delete_restaurant_option_by_pk {
    final local$delete_restaurant_option_by_pk =
        _instance.delete_restaurant_option_by_pk;
    return local$delete_restaurant_option_by_pk == null
        ? CopyWith$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk(
            local$delete_restaurant_option_by_pk,
            (e) => call(delete_restaurant_option_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteOptionbyId<TRes>
    implements CopyWith$Mutation$deleteOptionbyId<TRes> {
  _CopyWithStubImpl$Mutation$deleteOptionbyId(this._res);

  TRes _res;

  call({
    Mutation$deleteOptionbyId$delete_restaurant_option_by_pk?
        delete_restaurant_option_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk<TRes>
      get delete_restaurant_option_by_pk =>
          CopyWith$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk
              .stub(_res);
}

const documentNodeMutationdeleteOptionbyId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteOptionbyId'),
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
        name: NameNode(value: 'delete_restaurant_option_by_pk'),
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
Mutation$deleteOptionbyId _parserFn$Mutation$deleteOptionbyId(
        Map<String, dynamic> data) =>
    Mutation$deleteOptionbyId.fromJson(data);
typedef OnMutationCompleted$Mutation$deleteOptionbyId = FutureOr<void> Function(
  dynamic,
  Mutation$deleteOptionbyId?,
);

class Options$Mutation$deleteOptionbyId
    extends graphql.MutationOptions<Mutation$deleteOptionbyId> {
  Options$Mutation$deleteOptionbyId({
    String? operationName,
    required Variables$Mutation$deleteOptionbyId variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteOptionbyId? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteOptionbyId>? update,
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
                        : _parserFn$Mutation$deleteOptionbyId(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteOptionbyId,
          parserFn: _parserFn$Mutation$deleteOptionbyId,
        );

  final OnMutationCompleted$Mutation$deleteOptionbyId? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$deleteOptionbyId
    extends graphql.WatchQueryOptions<Mutation$deleteOptionbyId> {
  WatchOptions$Mutation$deleteOptionbyId({
    String? operationName,
    required Variables$Mutation$deleteOptionbyId variables,
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
          document: documentNodeMutationdeleteOptionbyId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$deleteOptionbyId,
        );
}

extension ClientExtension$Mutation$deleteOptionbyId on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$deleteOptionbyId>>
      mutate$deleteOptionbyId(
              Options$Mutation$deleteOptionbyId options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$deleteOptionbyId>
      watchMutation$deleteOptionbyId(
              WatchOptions$Mutation$deleteOptionbyId options) =>
          this.watchMutation(options);
}

class Mutation$deleteOptionbyId$delete_restaurant_option_by_pk {
  Mutation$deleteOptionbyId$delete_restaurant_option_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$deleteOptionbyId$delete_restaurant_option_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteOptionbyId$delete_restaurant_option_by_pk(
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
    if (!(other is Mutation$deleteOptionbyId$delete_restaurant_option_by_pk) ||
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

extension UtilityExtension$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk
    on Mutation$deleteOptionbyId$delete_restaurant_option_by_pk {
  CopyWith$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk<
          Mutation$deleteOptionbyId$delete_restaurant_option_by_pk>
      get copyWith =>
          CopyWith$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk<
    TRes> {
  factory CopyWith$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk(
    Mutation$deleteOptionbyId$delete_restaurant_option_by_pk instance,
    TRes Function(Mutation$deleteOptionbyId$delete_restaurant_option_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk;

  factory CopyWith$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk<
        TRes>
    implements
        CopyWith$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$deleteOptionbyId$delete_restaurant_option_by_pk _instance;

  final TRes Function(Mutation$deleteOptionbyId$delete_restaurant_option_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteOptionbyId$delete_restaurant_option_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk<
        TRes>
    implements
        CopyWith$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$deleteOptionbyId$delete_restaurant_option_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getOptionById {
  factory Variables$Query$getOptionById({required int optionId}) =>
      Variables$Query$getOptionById._({
        r'optionId': optionId,
      });

  Variables$Query$getOptionById._(this._$data);

  factory Variables$Query$getOptionById.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$optionId = data['optionId'];
    result$data['optionId'] = (l$optionId as int);
    return Variables$Query$getOptionById._(result$data);
  }

  Map<String, dynamic> _$data;

  int get optionId => (_$data['optionId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$optionId = optionId;
    result$data['optionId'] = l$optionId;
    return result$data;
  }

  CopyWith$Variables$Query$getOptionById<Variables$Query$getOptionById>
      get copyWith => CopyWith$Variables$Query$getOptionById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getOptionById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$optionId = optionId;
    final lOther$optionId = other.optionId;
    if (l$optionId != lOther$optionId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$optionId = optionId;
    return Object.hashAll([l$optionId]);
  }
}

abstract class CopyWith$Variables$Query$getOptionById<TRes> {
  factory CopyWith$Variables$Query$getOptionById(
    Variables$Query$getOptionById instance,
    TRes Function(Variables$Query$getOptionById) then,
  ) = _CopyWithImpl$Variables$Query$getOptionById;

  factory CopyWith$Variables$Query$getOptionById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getOptionById;

  TRes call({int? optionId});
}

class _CopyWithImpl$Variables$Query$getOptionById<TRes>
    implements CopyWith$Variables$Query$getOptionById<TRes> {
  _CopyWithImpl$Variables$Query$getOptionById(
    this._instance,
    this._then,
  );

  final Variables$Query$getOptionById _instance;

  final TRes Function(Variables$Query$getOptionById) _then;

  static const _undefined = {};

  TRes call({Object? optionId = _undefined}) =>
      _then(Variables$Query$getOptionById._({
        ..._instance._$data,
        if (optionId != _undefined && optionId != null)
          'optionId': (optionId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getOptionById<TRes>
    implements CopyWith$Variables$Query$getOptionById<TRes> {
  _CopyWithStubImpl$Variables$Query$getOptionById(this._res);

  TRes _res;

  call({int? optionId}) => _res;
}

class Query$getOptionById {
  Query$getOptionById({
    this.restaurant_option_by_pk,
    required this.$__typename,
  });

  factory Query$getOptionById.fromJson(Map<String, dynamic> json) {
    final l$restaurant_option_by_pk = json['restaurant_option_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getOptionById(
      restaurant_option_by_pk: l$restaurant_option_by_pk == null
          ? null
          : Query$getOptionById$restaurant_option_by_pk.fromJson(
              (l$restaurant_option_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getOptionById$restaurant_option_by_pk? restaurant_option_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_option_by_pk = restaurant_option_by_pk;
    _resultData['restaurant_option_by_pk'] =
        l$restaurant_option_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_option_by_pk = restaurant_option_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_option_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOptionById) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_option_by_pk = restaurant_option_by_pk;
    final lOther$restaurant_option_by_pk = other.restaurant_option_by_pk;
    if (l$restaurant_option_by_pk != lOther$restaurant_option_by_pk) {
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

extension UtilityExtension$Query$getOptionById on Query$getOptionById {
  CopyWith$Query$getOptionById<Query$getOptionById> get copyWith =>
      CopyWith$Query$getOptionById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getOptionById<TRes> {
  factory CopyWith$Query$getOptionById(
    Query$getOptionById instance,
    TRes Function(Query$getOptionById) then,
  ) = _CopyWithImpl$Query$getOptionById;

  factory CopyWith$Query$getOptionById.stub(TRes res) =
      _CopyWithStubImpl$Query$getOptionById;

  TRes call({
    Query$getOptionById$restaurant_option_by_pk? restaurant_option_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getOptionById$restaurant_option_by_pk<TRes>
      get restaurant_option_by_pk;
}

class _CopyWithImpl$Query$getOptionById<TRes>
    implements CopyWith$Query$getOptionById<TRes> {
  _CopyWithImpl$Query$getOptionById(
    this._instance,
    this._then,
  );

  final Query$getOptionById _instance;

  final TRes Function(Query$getOptionById) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_option_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOptionById(
        restaurant_option_by_pk: restaurant_option_by_pk == _undefined
            ? _instance.restaurant_option_by_pk
            : (restaurant_option_by_pk
                as Query$getOptionById$restaurant_option_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOptionById$restaurant_option_by_pk<TRes>
      get restaurant_option_by_pk {
    final local$restaurant_option_by_pk = _instance.restaurant_option_by_pk;
    return local$restaurant_option_by_pk == null
        ? CopyWith$Query$getOptionById$restaurant_option_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getOptionById$restaurant_option_by_pk(
            local$restaurant_option_by_pk,
            (e) => call(restaurant_option_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getOptionById<TRes>
    implements CopyWith$Query$getOptionById<TRes> {
  _CopyWithStubImpl$Query$getOptionById(this._res);

  TRes _res;

  call({
    Query$getOptionById$restaurant_option_by_pk? restaurant_option_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOptionById$restaurant_option_by_pk<TRes>
      get restaurant_option_by_pk =>
          CopyWith$Query$getOptionById$restaurant_option_by_pk.stub(_res);
}

const documentNodeQuerygetOptionById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getOptionById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'optionId')),
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
        name: NameNode(value: 'restaurant_option_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'optionId')),
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
            name: NameNode(value: 'free_choice'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cost_per_extra'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'option_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'position'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'maximum_choice'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'minimum_choice'),
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
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'translations'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'language_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'value'),
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
            name: NameNode(value: 'choices'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'option_choices'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'available'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'cost'),
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
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
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
                        name: NameNode(value: 'translations'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'language_id'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'value'),
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
Query$getOptionById _parserFn$Query$getOptionById(Map<String, dynamic> data) =>
    Query$getOptionById.fromJson(data);

class Options$Query$getOptionById
    extends graphql.QueryOptions<Query$getOptionById> {
  Options$Query$getOptionById({
    String? operationName,
    required Variables$Query$getOptionById variables,
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
          document: documentNodeQuerygetOptionById,
          parserFn: _parserFn$Query$getOptionById,
        );
}

class WatchOptions$Query$getOptionById
    extends graphql.WatchQueryOptions<Query$getOptionById> {
  WatchOptions$Query$getOptionById({
    String? operationName,
    required Variables$Query$getOptionById variables,
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
          document: documentNodeQuerygetOptionById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getOptionById,
        );
}

class FetchMoreOptions$Query$getOptionById extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getOptionById({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getOptionById variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetOptionById,
        );
}

extension ClientExtension$Query$getOptionById on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getOptionById>> query$getOptionById(
          Options$Query$getOptionById options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getOptionById> watchQuery$getOptionById(
          WatchOptions$Query$getOptionById options) =>
      this.watchQuery(options);
  void writeQuery$getOptionById({
    required Query$getOptionById data,
    required Variables$Query$getOptionById variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetOptionById),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getOptionById? readQuery$getOptionById({
    required Variables$Query$getOptionById variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetOptionById),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getOptionById.fromJson(result);
  }
}

class Query$getOptionById$restaurant_option_by_pk {
  Query$getOptionById$restaurant_option_by_pk({
    required this.id,
    required this.free_choice,
    required this.cost_per_extra,
    required this.option_type,
    required this.position,
    required this.maximum_choice,
    required this.minimum_choice,
    required this.name,
    required this.choices,
    required this.$__typename,
  });

  factory Query$getOptionById$restaurant_option_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$free_choice = json['free_choice'];
    final l$cost_per_extra = json['cost_per_extra'];
    final l$option_type = json['option_type'];
    final l$position = json['position'];
    final l$maximum_choice = json['maximum_choice'];
    final l$minimum_choice = json['minimum_choice'];
    final l$name = json['name'];
    final l$choices = json['choices'];
    final l$$__typename = json['__typename'];
    return Query$getOptionById$restaurant_option_by_pk(
      id: (l$id as int),
      free_choice: (l$free_choice as int),
      cost_per_extra: MoneyFromJson(l$cost_per_extra),
      option_type: (l$option_type as String),
      position: (l$position as int),
      maximum_choice: (l$maximum_choice as int),
      minimum_choice: (l$minimum_choice as int),
      name: Query$getOptionById$restaurant_option_by_pk$name.fromJson(
          (l$name as Map<String, dynamic>)),
      choices: (l$choices as List<dynamic>)
          .map((e) =>
              Query$getOptionById$restaurant_option_by_pk$choices.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int free_choice;

  final double cost_per_extra;

  final String option_type;

  final int position;

  final int maximum_choice;

  final int minimum_choice;

  final Query$getOptionById$restaurant_option_by_pk$name name;

  final List<Query$getOptionById$restaurant_option_by_pk$choices> choices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$free_choice = free_choice;
    _resultData['free_choice'] = l$free_choice;
    final l$cost_per_extra = cost_per_extra;
    _resultData['cost_per_extra'] = MoneyToJson(l$cost_per_extra);
    final l$option_type = option_type;
    _resultData['option_type'] = l$option_type;
    final l$position = position;
    _resultData['position'] = l$position;
    final l$maximum_choice = maximum_choice;
    _resultData['maximum_choice'] = l$maximum_choice;
    final l$minimum_choice = minimum_choice;
    _resultData['minimum_choice'] = l$minimum_choice;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$choices = choices;
    _resultData['choices'] = l$choices.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$free_choice = free_choice;
    final l$cost_per_extra = cost_per_extra;
    final l$option_type = option_type;
    final l$position = position;
    final l$maximum_choice = maximum_choice;
    final l$minimum_choice = minimum_choice;
    final l$name = name;
    final l$choices = choices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$free_choice,
      l$cost_per_extra,
      l$option_type,
      l$position,
      l$maximum_choice,
      l$minimum_choice,
      l$name,
      Object.hashAll(l$choices.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOptionById$restaurant_option_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$free_choice = free_choice;
    final lOther$free_choice = other.free_choice;
    if (l$free_choice != lOther$free_choice) {
      return false;
    }
    final l$cost_per_extra = cost_per_extra;
    final lOther$cost_per_extra = other.cost_per_extra;
    if (l$cost_per_extra != lOther$cost_per_extra) {
      return false;
    }
    final l$option_type = option_type;
    final lOther$option_type = other.option_type;
    if (l$option_type != lOther$option_type) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$maximum_choice = maximum_choice;
    final lOther$maximum_choice = other.maximum_choice;
    if (l$maximum_choice != lOther$maximum_choice) {
      return false;
    }
    final l$minimum_choice = minimum_choice;
    final lOther$minimum_choice = other.minimum_choice;
    if (l$minimum_choice != lOther$minimum_choice) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$choices = choices;
    final lOther$choices = other.choices;
    if (l$choices.length != lOther$choices.length) {
      return false;
    }
    for (int i = 0; i < l$choices.length; i++) {
      final l$choices$entry = l$choices[i];
      final lOther$choices$entry = lOther$choices[i];
      if (l$choices$entry != lOther$choices$entry) {
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

extension UtilityExtension$Query$getOptionById$restaurant_option_by_pk
    on Query$getOptionById$restaurant_option_by_pk {
  CopyWith$Query$getOptionById$restaurant_option_by_pk<
          Query$getOptionById$restaurant_option_by_pk>
      get copyWith => CopyWith$Query$getOptionById$restaurant_option_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOptionById$restaurant_option_by_pk<TRes> {
  factory CopyWith$Query$getOptionById$restaurant_option_by_pk(
    Query$getOptionById$restaurant_option_by_pk instance,
    TRes Function(Query$getOptionById$restaurant_option_by_pk) then,
  ) = _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk;

  factory CopyWith$Query$getOptionById$restaurant_option_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk;

  TRes call({
    int? id,
    int? free_choice,
    double? cost_per_extra,
    String? option_type,
    int? position,
    int? maximum_choice,
    int? minimum_choice,
    Query$getOptionById$restaurant_option_by_pk$name? name,
    List<Query$getOptionById$restaurant_option_by_pk$choices>? choices,
    String? $__typename,
  });
  CopyWith$Query$getOptionById$restaurant_option_by_pk$name<TRes> get name;
  TRes choices(
      Iterable<Query$getOptionById$restaurant_option_by_pk$choices> Function(
              Iterable<
                  CopyWith$Query$getOptionById$restaurant_option_by_pk$choices<
                      Query$getOptionById$restaurant_option_by_pk$choices>>)
          _fn);
}

class _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk<TRes>
    implements CopyWith$Query$getOptionById$restaurant_option_by_pk<TRes> {
  _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk(
    this._instance,
    this._then,
  );

  final Query$getOptionById$restaurant_option_by_pk _instance;

  final TRes Function(Query$getOptionById$restaurant_option_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? free_choice = _undefined,
    Object? cost_per_extra = _undefined,
    Object? option_type = _undefined,
    Object? position = _undefined,
    Object? maximum_choice = _undefined,
    Object? minimum_choice = _undefined,
    Object? name = _undefined,
    Object? choices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOptionById$restaurant_option_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        free_choice: free_choice == _undefined || free_choice == null
            ? _instance.free_choice
            : (free_choice as int),
        cost_per_extra: cost_per_extra == _undefined || cost_per_extra == null
            ? _instance.cost_per_extra
            : (cost_per_extra as double),
        option_type: option_type == _undefined || option_type == null
            ? _instance.option_type
            : (option_type as String),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        maximum_choice: maximum_choice == _undefined || maximum_choice == null
            ? _instance.maximum_choice
            : (maximum_choice as int),
        minimum_choice: minimum_choice == _undefined || minimum_choice == null
            ? _instance.minimum_choice
            : (minimum_choice as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$getOptionById$restaurant_option_by_pk$name),
        choices: choices == _undefined || choices == null
            ? _instance.choices
            : (choices
                as List<Query$getOptionById$restaurant_option_by_pk$choices>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOptionById$restaurant_option_by_pk$name<TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getOptionById$restaurant_option_by_pk$name(
        local$name, (e) => call(name: e));
  }

  TRes choices(
          Iterable<Query$getOptionById$restaurant_option_by_pk$choices> Function(
                  Iterable<
                      CopyWith$Query$getOptionById$restaurant_option_by_pk$choices<
                          Query$getOptionById$restaurant_option_by_pk$choices>>)
              _fn) =>
      call(
          choices: _fn(_instance.choices.map((e) =>
              CopyWith$Query$getOptionById$restaurant_option_by_pk$choices(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk<TRes>
    implements CopyWith$Query$getOptionById$restaurant_option_by_pk<TRes> {
  _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk(this._res);

  TRes _res;

  call({
    int? id,
    int? free_choice,
    double? cost_per_extra,
    String? option_type,
    int? position,
    int? maximum_choice,
    int? minimum_choice,
    Query$getOptionById$restaurant_option_by_pk$name? name,
    List<Query$getOptionById$restaurant_option_by_pk$choices>? choices,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOptionById$restaurant_option_by_pk$name<TRes> get name =>
      CopyWith$Query$getOptionById$restaurant_option_by_pk$name.stub(_res);
  choices(_fn) => _res;
}

class Query$getOptionById$restaurant_option_by_pk$name {
  Query$getOptionById$restaurant_option_by_pk$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getOptionById$restaurant_option_by_pk$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getOptionById$restaurant_option_by_pk$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getOptionById$restaurant_option_by_pk$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<Query$getOptionById$restaurant_option_by_pk$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      Object.hashAll(l$translations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOptionById$restaurant_option_by_pk$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$translations = translations;
    final lOther$translations = other.translations;
    if (l$translations.length != lOther$translations.length) {
      return false;
    }
    for (int i = 0; i < l$translations.length; i++) {
      final l$translations$entry = l$translations[i];
      final lOther$translations$entry = lOther$translations[i];
      if (l$translations$entry != lOther$translations$entry) {
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

extension UtilityExtension$Query$getOptionById$restaurant_option_by_pk$name
    on Query$getOptionById$restaurant_option_by_pk$name {
  CopyWith$Query$getOptionById$restaurant_option_by_pk$name<
          Query$getOptionById$restaurant_option_by_pk$name>
      get copyWith => CopyWith$Query$getOptionById$restaurant_option_by_pk$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOptionById$restaurant_option_by_pk$name<TRes> {
  factory CopyWith$Query$getOptionById$restaurant_option_by_pk$name(
    Query$getOptionById$restaurant_option_by_pk$name instance,
    TRes Function(Query$getOptionById$restaurant_option_by_pk$name) then,
  ) = _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$name;

  factory CopyWith$Query$getOptionById$restaurant_option_by_pk$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$name;

  TRes call({
    int? id,
    List<Query$getOptionById$restaurant_option_by_pk$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getOptionById$restaurant_option_by_pk$name$translations> Function(
              Iterable<
                  CopyWith$Query$getOptionById$restaurant_option_by_pk$name$translations<
                      Query$getOptionById$restaurant_option_by_pk$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$name<TRes>
    implements CopyWith$Query$getOptionById$restaurant_option_by_pk$name<TRes> {
  _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$name(
    this._instance,
    this._then,
  );

  final Query$getOptionById$restaurant_option_by_pk$name _instance;

  final TRes Function(Query$getOptionById$restaurant_option_by_pk$name) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOptionById$restaurant_option_by_pk$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getOptionById$restaurant_option_by_pk$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getOptionById$restaurant_option_by_pk$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getOptionById$restaurant_option_by_pk$name$translations<
                          Query$getOptionById$restaurant_option_by_pk$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getOptionById$restaurant_option_by_pk$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$name<TRes>
    implements CopyWith$Query$getOptionById$restaurant_option_by_pk$name<TRes> {
  _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$name(this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getOptionById$restaurant_option_by_pk$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getOptionById$restaurant_option_by_pk$name$translations {
  Query$getOptionById$restaurant_option_by_pk$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getOptionById$restaurant_option_by_pk$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getOptionById$restaurant_option_by_pk$name$translations(
      language_id: (l$language_id as String),
      value: (l$value as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String language_id;

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$language_id = language_id;
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$language_id,
      l$value,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOptionById$restaurant_option_by_pk$name$translations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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

extension UtilityExtension$Query$getOptionById$restaurant_option_by_pk$name$translations
    on Query$getOptionById$restaurant_option_by_pk$name$translations {
  CopyWith$Query$getOptionById$restaurant_option_by_pk$name$translations<
          Query$getOptionById$restaurant_option_by_pk$name$translations>
      get copyWith =>
          CopyWith$Query$getOptionById$restaurant_option_by_pk$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOptionById$restaurant_option_by_pk$name$translations<
    TRes> {
  factory CopyWith$Query$getOptionById$restaurant_option_by_pk$name$translations(
    Query$getOptionById$restaurant_option_by_pk$name$translations instance,
    TRes Function(Query$getOptionById$restaurant_option_by_pk$name$translations)
        then,
  ) = _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$name$translations;

  factory CopyWith$Query$getOptionById$restaurant_option_by_pk$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Query$getOptionById$restaurant_option_by_pk$name$translations<
            TRes> {
  _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$name$translations(
    this._instance,
    this._then,
  );

  final Query$getOptionById$restaurant_option_by_pk$name$translations _instance;

  final TRes Function(
      Query$getOptionById$restaurant_option_by_pk$name$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOptionById$restaurant_option_by_pk$name$translations(
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        value: value == _undefined || value == null
            ? _instance.value
            : (value as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$name$translations<
        TRes>
    implements
        CopyWith$Query$getOptionById$restaurant_option_by_pk$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getOptionById$restaurant_option_by_pk$choices {
  Query$getOptionById$restaurant_option_by_pk$choices({
    required this.option_choices,
    required this.$__typename,
  });

  factory Query$getOptionById$restaurant_option_by_pk$choices.fromJson(
      Map<String, dynamic> json) {
    final l$option_choices = json['option_choices'];
    final l$$__typename = json['__typename'];
    return Query$getOptionById$restaurant_option_by_pk$choices(
      option_choices: (l$option_choices as List<dynamic>)
          .map((e) =>
              Query$getOptionById$restaurant_option_by_pk$choices$option_choices
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getOptionById$restaurant_option_by_pk$choices$option_choices>
      option_choices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$option_choices = option_choices;
    _resultData['option_choices'] =
        l$option_choices.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$option_choices = option_choices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$option_choices.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOptionById$restaurant_option_by_pk$choices) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$option_choices = option_choices;
    final lOther$option_choices = other.option_choices;
    if (l$option_choices.length != lOther$option_choices.length) {
      return false;
    }
    for (int i = 0; i < l$option_choices.length; i++) {
      final l$option_choices$entry = l$option_choices[i];
      final lOther$option_choices$entry = lOther$option_choices[i];
      if (l$option_choices$entry != lOther$option_choices$entry) {
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

extension UtilityExtension$Query$getOptionById$restaurant_option_by_pk$choices
    on Query$getOptionById$restaurant_option_by_pk$choices {
  CopyWith$Query$getOptionById$restaurant_option_by_pk$choices<
          Query$getOptionById$restaurant_option_by_pk$choices>
      get copyWith =>
          CopyWith$Query$getOptionById$restaurant_option_by_pk$choices(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOptionById$restaurant_option_by_pk$choices<
    TRes> {
  factory CopyWith$Query$getOptionById$restaurant_option_by_pk$choices(
    Query$getOptionById$restaurant_option_by_pk$choices instance,
    TRes Function(Query$getOptionById$restaurant_option_by_pk$choices) then,
  ) = _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$choices;

  factory CopyWith$Query$getOptionById$restaurant_option_by_pk$choices.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$choices;

  TRes call({
    List<Query$getOptionById$restaurant_option_by_pk$choices$option_choices>?
        option_choices,
    String? $__typename,
  });
  TRes option_choices(
      Iterable<Query$getOptionById$restaurant_option_by_pk$choices$option_choices> Function(
              Iterable<
                  CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices<
                      Query$getOptionById$restaurant_option_by_pk$choices$option_choices>>)
          _fn);
}

class _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$choices<TRes>
    implements
        CopyWith$Query$getOptionById$restaurant_option_by_pk$choices<TRes> {
  _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$choices(
    this._instance,
    this._then,
  );

  final Query$getOptionById$restaurant_option_by_pk$choices _instance;

  final TRes Function(Query$getOptionById$restaurant_option_by_pk$choices)
      _then;

  static const _undefined = {};

  TRes call({
    Object? option_choices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOptionById$restaurant_option_by_pk$choices(
        option_choices: option_choices == _undefined || option_choices == null
            ? _instance.option_choices
            : (option_choices as List<
                Query$getOptionById$restaurant_option_by_pk$choices$option_choices>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes option_choices(
          Iterable<Query$getOptionById$restaurant_option_by_pk$choices$option_choices> Function(
                  Iterable<
                      CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices<
                          Query$getOptionById$restaurant_option_by_pk$choices$option_choices>>)
              _fn) =>
      call(
          option_choices: _fn(_instance.option_choices.map((e) =>
              CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$choices<
        TRes>
    implements
        CopyWith$Query$getOptionById$restaurant_option_by_pk$choices<TRes> {
  _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$choices(
      this._res);

  TRes _res;

  call({
    List<Query$getOptionById$restaurant_option_by_pk$choices$option_choices>?
        option_choices,
    String? $__typename,
  }) =>
      _res;
  option_choices(_fn) => _res;
}

class Query$getOptionById$restaurant_option_by_pk$choices$option_choices {
  Query$getOptionById$restaurant_option_by_pk$choices$option_choices({
    required this.available,
    required this.cost,
    required this.id,
    required this.name,
    required this.$__typename,
  });

  factory Query$getOptionById$restaurant_option_by_pk$choices$option_choices.fromJson(
      Map<String, dynamic> json) {
    final l$available = json['available'];
    final l$cost = json['cost'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getOptionById$restaurant_option_by_pk$choices$option_choices(
      available: (l$available as bool),
      cost: MoneyFromJson(l$cost),
      id: (l$id as int),
      name:
          Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name
              .fromJson((l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool available;

  final double cost;

  final int id;

  final Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name
      name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$available = available;
    _resultData['available'] = l$available;
    final l$cost = cost;
    _resultData['cost'] = MoneyToJson(l$cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$available = available;
    final l$cost = cost;
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$available,
      l$cost,
      l$id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOptionById$restaurant_option_by_pk$choices$option_choices) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getOptionById$restaurant_option_by_pk$choices$option_choices
    on Query$getOptionById$restaurant_option_by_pk$choices$option_choices {
  CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices<
          Query$getOptionById$restaurant_option_by_pk$choices$option_choices>
      get copyWith =>
          CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices<
    TRes> {
  factory CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices(
    Query$getOptionById$restaurant_option_by_pk$choices$option_choices instance,
    TRes Function(
            Query$getOptionById$restaurant_option_by_pk$choices$option_choices)
        then,
  ) = _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices;

  factory CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices;

  TRes call({
    bool? available,
    double? cost,
    int? id,
    Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name?
        name,
    String? $__typename,
  });
  CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name<
      TRes> get name;
}

class _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices<
        TRes>
    implements
        CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices<
            TRes> {
  _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices(
    this._instance,
    this._then,
  );

  final Query$getOptionById$restaurant_option_by_pk$choices$option_choices
      _instance;

  final TRes Function(
      Query$getOptionById$restaurant_option_by_pk$choices$option_choices) _then;

  static const _undefined = {};

  TRes call({
    Object? available = _undefined,
    Object? cost = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOptionById$restaurant_option_by_pk$choices$option_choices(
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices<
        TRes>
    implements
        CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices<
            TRes> {
  _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices(
      this._res);

  TRes _res;

  call({
    bool? available,
    double? cost,
    int? id,
    Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name?
        name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name<
          TRes>
      get name =>
          CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name
              .stub(_res);
}

class Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name {
  Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      Object.hashAll(l$translations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$translations = translations;
    final lOther$translations = other.translations;
    if (l$translations.length != lOther$translations.length) {
      return false;
    }
    for (int i = 0; i < l$translations.length; i++) {
      final l$translations$entry = l$translations[i];
      final lOther$translations$entry = lOther$translations[i];
      if (l$translations$entry != lOther$translations$entry) {
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

extension UtilityExtension$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name
    on Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name {
  CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name<
          Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name>
      get copyWith =>
          CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name<
    TRes> {
  factory CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name(
    Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name
        instance,
    TRes Function(
            Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name)
        then,
  ) = _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name;

  factory CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name;

  TRes call({
    int? id,
    List<Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations> Function(
              Iterable<
                  CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations<
                      Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name<
        TRes>
    implements
        CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name<
            TRes> {
  _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name(
    this._instance,
    this._then,
  );

  final Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name
      _instance;

  final TRes Function(
          Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations<
                          Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name<
        TRes>
    implements
        CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name<
            TRes> {
  _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations {
  Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations(
      language_id: (l$language_id as String),
      value: (l$value as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String language_id;

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$language_id = language_id;
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$language_id,
      l$value,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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

extension UtilityExtension$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations
    on Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations {
  CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations<
          Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations>
      get copyWith =>
          CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations<
    TRes> {
  factory CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations(
    Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations
        instance,
    TRes Function(
            Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations)
        then,
  ) = _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations;

  factory CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations<
        TRes>
    implements
        CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations<
            TRes> {
  _CopyWithImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations(
    this._instance,
    this._then,
  );

  final Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations
      _instance;

  final TRes Function(
          Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations(
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        value: value == _undefined || value == null
            ? _instance.value
            : (value as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations<
        TRes>
    implements
        CopyWith$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getOptionById$restaurant_option_by_pk$choices$option_choices$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}
